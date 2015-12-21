#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'
require 'socket'
require 'tmpdir'

# Helper class to use docker for the Jubula AUT
class DockerRunner
  attr_reader :container_home, :cleanup_in_container
  # http://stackoverflow.com/questions/14112955/how-to-get-my-machines-ip-address-from-ruby-without-leveraging-from-other-ip-ad
  def local_ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true # turn off reverse DNS resolution temporarily
    UDPSocket.open do |s|
      s.connect '192.168.1.1', 1
      s.addr.last
    end
  ensure
    Socket.do_not_reverse_lookup = orig
  end

  def start_docker(cmd_in_docker, env = nil, workdir = nil)
    # First cleanup possible remnants of old runs
    [ @m2_repo, @container_home, @result_dir].each do |dir|
      FileUtils.makedirs(dir, :verbose => true) unless File.exist?(dir)
      FileUtils.chmod(0777, dir)
    end
    cmd = 'docker run --detach'
    cmd += " --env=#{env}" if env
    cmd += " --workdir=#{workdir}" if workdir
    cmd += " -v #{@container_home}:/home/elexis"
    cmd += " -v #{@result_dir}:/home/elexis/results"
    cmd += " -v #{@m2_repo}:/home/elexis/.m2"
    cmd += " --publish=#{local_ip}:8000:8000" if false # debug port for java
    cmd += " --publish=#{local_ip}:6333:6333" if false
    cmd += " --name=#{@docker_name} #{ElexisJubula::NAME}"
    cmd += ' ' + cmd_in_docker
    puts cmd
    system(cmd)
    # system("docker inspect #{@docker_name}") # Only for debugging!
  end

  def exec_in_docker(command, options = {})
    cmd = "docker exec #{options[:detach] ? '--detach' : ''}" # do it in the background
    cmd += " --env=#{options[:env]} " if options[:env]
    cmd += " --workdir=#{options[:workdir]}" if options[:workdir]
    cmd += " #{@docker_name} "
    cmd += command
    puts cmd
    Kernel.system(cmd)
  end

  def stop_docker
   if Kernel.system("docker ps  | grep #{@docker_name}")
      exec_in_docker(@cleanup_in_container)
      Kernel.system("docker kill #{@docker_name}")
      Kernel.system("docker rm #{@docker_name}")
    end
  end

  def initialize(test_name, result_dir)
    @test_name = test_name
    @result_dir = result_dir
    @docker_name = "jubula-#{@test_name}"
    @container_home =  File.join(RootDir, 'container_home')
    @m2_repo =  File.join(RootDir, 'container_home_m2')
    @cleanup_in_container = 'chmod --silent --recursive o+rwX /home/elexis; rm -rf /home/elexis/.jubula'
  end
end

# This is a small helper class to run the Jubula tests for Elexis either
# * on the developers host with the AUT on the same machine
# * on the developers host with the AUT running inside a docker container
# * on the Jenkins-CI with the AUT running inside a docker container
# In all cases we assume that the correct Jubula executable is installed on the host
class JubulaRunner
  attr_reader :start_time, :jubula_test_db_params, :jubula_test_data_dir, :rcp_support, :test_params

  def get_h2_db_params(full_path)
    "-dburl 'jdbc:h2:#{full_path};MVCC=TRUE;AUTO_SERVER=TRUE;DB_CLOSE_ON_EXIT=FALSE' -dbuser 'sa' -dbpw ''"
  end

  def store_cmd(name, doc)
    path = File.join(@docker ? @docker.container_home : RootDir, File.basename(name))
    FileUtils.makedirs(File.dirname(path))
    File.open(path, 'w') do |f|
      f.puts '#!/bin/sh -v'
      f.puts(doc)
    end
    FileUtils.chmod(0755, path)
  end

  def start_xvfb
    # http://support.xored.com/support/solutions/articles/3000028645
    # https://www.eclipse.org/forums/index.php?t=msg&th=440461&goto=987043&#msg_987043
    # Had window activation problem with Xvfb with or without awesome
    # with startx this did not gow
    if @docker
      puts "Starting start_xvfb in docker"
      start_meta = "/usr/bin/metacity display=$DISPLAY --replace --sm-disable &
      sleep 1
      /usr/bin/metacity-message disable-keybindings
      /usr/bin/xclock &
    "
      start_xvfb_cmd = 'Xvfb :1 -screen 5 1280x1024x24 -nolisten tcp'
      store_cmd('start_xvfb_cmd.sh', start_xvfb_cmd)
      @docker.start_docker('./start_xvfb_cmd.sh', 'DISPLAY=:1.5')
      sleep(0.5)
      store_cmd('start_meta.sh', start_meta)
      @docker.exec_in_docker('./start_meta.sh', {:detach => true})
      sleep(0.5)
      system('docker ps')
    end
  end

  def prepare_docker
    @docker.stop_docker
    at_exit { @docker.stop_docker }
    FileUtils.rm_rf(@docker.container_home, :verbose => true)
    raise "Must be possible to remove container_home #{@docker.container_home}" if File.exist?(@docker.container_home)
    ['.git', 'pom.xml', 'jubula-target', 'jubula-tests', 'org.eclipse.jubula.product.autagent.start'].each do |item|
      FileUtils.cp_r(File.join(RootDir, item), @docker.container_home, :verbose => true, :preserve => true)
    end
    FileUtils.makedirs(@docker.container_home)
    FileUtils.cp_r(WorkDir, File.join(@docker.container_home, 'work'), :verbose => true, :preserve => true)
  end

  def run_test_in_docker
    prepare_docker
    Dir.chdir(WorkDir)
    FileUtils.rm_f('jubula-tests/AUT_run.log', :verbose => true) if File.exist?('jubula-tests/AUT_run.log')
    start_xvfb
    sleep 0.5
    cmd = "status=99
mkdir -p /home/elexis/results
cp $0 /home/elexis/results
#{@mvn_cmd}
status=$?
echo run_test_in_docker done
sleep 1
#{@docker.cleanup_in_container}
rm -rf ~/.jubula
ls -lR /home/elexis/results
sleep 1
exit $status
"
    puts "Starting testexec in docker: #{cmd}"
    store_cmd('testexec.sh', cmd)
    begin
      res = @docker.exec_in_docker('./testexec.sh')
      puts "res of testexec.sh is #{res}"
      sleep(0.5)
    ensure
      # this is needed that copying  the results and log files will not fail
      @docker.exec_in_docker(@docker.cleanup_in_container)
      # stop container if we were unable to copy the result and/or log files
      @docker.stop_docker
    end
    exit res ? 0 : 1
  end

  def run_test_exec
    results = File.join(RootDir, 'results')
    Dir.chdir RootDir
    puts "Will run #{@mvn_cmd}"
    system(@mvn_cmd) # + ' --offline')
  ensure
    system("killall --quiet #{@test_params[:exe_name]}", MAY_FAIL)
  end

  def show_configuration
    puts "Configuration is:\n#{Config}"
    puts "Testparams for #{@test_name} are:\n#{@test_params}"
  end

  def run_test_suite(use_docker = false)
    @result_dir = File.join(RootDir, 'results')
    saved_dir = Dir.pwd
    if use_docker
      patch_acl_for_elexis_and_current_user
      @docker = DockerRunner.new(@test_name, @result_dir)
    end
    FileUtils.makedirs(WorkDir) unless File.directory?(WorkDir)
    FileUtils.rm_rf(@result_dir)
    FileUtils.makedirs(@result_dir)
    Dir.chdir(WorkDir)
    @mvn_cmd = "mvn integration-test -D#{@test_params[:test_to_run]}"
    @docker ? run_test_in_docker : run_test_exec
  ensure
    diff_time = (Time.now - @start_time).to_i
    puts "Running took #{diff_time} seconds"
    Dir.chdir(saved_dir)
  end

  def initialize(test2run)
    @test_name = test2run
    @start_time = Time.now
    @test_params = YAML.load_file(File.join(RootDir, 'definitions', "#{@test_name}.yaml"))
    show_configuration if $VERBOSE || DRY_RUN
    require 'install_open_source_elexis.rb' unless File.directory?(File.join(WorkDir, 'plugins'))
    @jubula_test_db_params = get_h2_db_params(File.join(WorkDir, 'database/embedded'))
    @jubula_test_data_dir  = File.join(WorkDir, 'database/data')
    install_rcp_support_for_jubula(WorkDir)
    patch_ini_file_for_jubula_rc(WorkDir)
  end
end

if ARGV.index('docker_build')
  docker_build
  ARGV.delete('docker_build')
  exit if ARGV.size == 0
end

if ARGV.index('run_in_docker')
  @run_in_docker = true
  ARGV.delete('run_in_docker')
end

ARGV.each do |a_test|
  test = JubulaRunner.new(a_test)
  test.run_test_suite(@run_in_docker)
end
