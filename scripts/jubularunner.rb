#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'
require 'socket'
require 'tmpdir'

# Helper class to use docker for the Jubula AUT
class DockerRunner
  attr_reader :container_home
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
    stop_docker
    [ @m2_repo, @container_home].each do |dir|
      next if File.exist?(dir)
      FileUtils.makedirs(dir, :verbose => true)
      FileUtils.chmod(0777, dir)
    end
    cmd = 'docker run --detach'
    cmd += " --env=#{env}" if env
    cmd += " --workdir=#{workdir}" if workdir
    cmd += " -v #{@container_home}:/home/elexis"
    cmd += " -v #{@m2_repo}:/home/elexis/.m2"
    cmd += " --publish=#{local_ip}:8000:8000" # debug port for java
    cmd += " --publish=#{local_ip}:6333:6333" if false
    cmd += " --name=jubula-#{@test_name} ngiger/jubula_runner"
    cmd += ' ' + cmd_in_docker
    puts cmd
    system(cmd)
  end

  def exec_in_docker(command, options = {})
    cmd = "docker exec #{options[:detach] ? '--detach' : ''}" # do it in the background
    cmd += " --env=#{options[:env]} " if options[:env]
    cmd += " --workdir=#{options[:workdir]}" if options[:workdir]
    cmd += " jubula-#{@test_name} "
    cmd += command
    puts cmd
    Kernel.system(cmd)
  end

  def stop_docker
    system("docker kill jubula-#{@test_name}", true)
    system("docker rm jubula-#{@test_name}", true)
  end

  def initialize(test_name)
    @test_name = test_name
    # @container_home = Dir.mktmpdir('jubula_test_')
    @container_home =  File.join(RootDir, 'container_home')
    @m2_repo =  File.join(RootDir, 'container_home_m2')
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

  def ensure_presence_of_jubula
    @autagent = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autagent'))
    puts "Found all tools to be able to run #{@test_xml}"
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

  def start_autagent
    # http://support.xored.com/support/solutions/articles/3000028645
    # https://www.eclipse.org/forums/index.php?t=msg&th=440461&goto=987043&#msg_987043
    # Had window activation problem with Xvfb with or without awesome
    # with startx this did not gow
    puts "Starting autagent with port #{Config[:agent_port]}"
    autagent_cmd = "#{@autagent} -l -p #{Config[:agent_port]}"
    if @docker
      start_meta = "/usr/bin/metacity display=$DISPLAY --replace --sm-disable &
      sleep 1
      /usr/bin/metacity-message disable-keybindings
      /usr/bin/xclock &
    "
      start_xvfb = 'Xvfb :1 -screen 5 1280x10240x24 -nolisten tcp'
      store_cmd('start_xvfb.sh', start_xvfb)
      @docker.start_docker('./start_xvfb.sh', 'DISPLAY=:1.5')
      sleep(0.5)
      store_cmd('start_meta.sh', start_meta)
      @docker.exec_in_docker('./start_meta.sh', {:detach => true})

      # @docker.exec_in_docker("fluxbox", {:detach => true})
      sleep(0.5)
      store_cmd('./autagent_cmd.sh', autagent_cmd)
      @docker.exec_in_docker(autagent_cmd, {:detach => true})
      sleep(0.5)
      system('docker ps')
    else
      system(autagent_cmd + ' &')
    end
  end

  def prepare_docker
    FileUtils.rm_rf(@docker.container_home, :verbose => true)
    raise "Must be possible to remove container_home #{@docker.container_home}" if File.exist?(@docker.container_home)
    ['.git', 'pom.xml', 'jubula-target', 'jubula-tests'].each do |item|
      FileUtils.cp_r(File.join(RootDir, item), @docker.container_home, :verbose => true, :preserve => true)
    end
    FileUtils.makedirs(@docker.container_home)
    FileUtils.cp_r(WorkDir, File.join(@docker.container_home, 'work'), :verbose => true, :preserve => true)
  end

  def run_test_in_docker
    prepare_docker
    Dir.chdir(WorkDir)
    FileUtils.rm_f('jubula-tests/AUT_run.log', :verbose => true) if File.exist?('jubula-tests/AUT_run.log')
    start_autagent
    sleep 0.5
    cmd = "ps -ef | grep autagent
ps -ef
mkdir -p /home/elexis/results
#{@mvn_cmd}
echo run_test_in_docker done
sleep 1
/bin/chmod --silent --recursive o+rwX /home/elexis
# chmod exited with 1, therefore must run another command
echo cleanup done
"
    puts "Starting testexec in docker: #{cmd}"
    store_cmd('testexec.sh', cmd)
    begin
      res = @docker.exec_in_docker('./testexec.sh')
      puts "res of testexec.sh is #{res}"
      sleep(0.5)
    ensure
      # this is needed that copying  the results and log files will not fail
      @docker.exec_in_docker('chmod --silent --recursive o+rwX /home/elexis')
    end
    begin
      src = "#{@docker.container_home}/results"
      FileUtils.cp_r(src,  RootDir, :verbose => true) if File.directory?(src)
      files = Dir.glob("#{@docker.container_home}/**/*.log**")
      files.each do |f|
        next unless f && File.file?(f)
        next if /\.jar$/i.match(f)
        dest = File.join(File.join(RootDir, 'results'), File.basename(f) ? File.basename(f) : Time.now.strftime(Time.now.strftime('%d.%m.%Y_%H_%M_%S'))+'.log')
        FileUtils.cp(f, dest, :verbose => true)
      end
    ensure
      # stop container if we were unable to copy the result and/or log files
      @docker.stop_docker
      FileUtils.rm_rf(@docker.container_home, :verbose => true, :noop => true)
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

  def stop_agent
    system("#{@autagent} -stop -p #{Config[:agent_port]} &")
  end

  def show_configuration
    puts "Configuration is:\n#{Config}"
    puts "Testparams for #{@test_name} are:\n#{@test_params}"
  end

  def run_test_suite(use_docker = false)
    saved_dir = Dir.pwd
    if use_docker
      patch_acl_for_elexis_and_current_user
      @docker = DockerRunner.new(@test_name)
    end
    FileUtils.makedirs(WorkDir) unless File.directory?(WorkDir)
    FileUtils.makedirs(File.join(RootDir, 'results'))
    Dir.chdir(WorkDir)
    ensure_presence_of_jubula
    @mvn_cmd = "mvn clean integration-test -D#{@test_params[:test_to_run]}"
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
    @jubula_test_db_params = get_h2_db_params(File.join(WorkDir, 'database/embedded'))
    @jubula_test_data_dir  = File.join(WorkDir, 'database/data')
    install_rcp_support_for_jubula
    patch_ini_file_for_jubula_rc
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
