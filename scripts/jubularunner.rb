#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'
require 'socket'

# Helper class to use docker for the Jubula AUT
class DockerRunner
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

  def docker_ip
    return '127.0.0.1' if DRY_RUN
    puts "cmd docker inspect jubula-#{@test_name} | grep IPAddress"
    result = `docker inspect jubula-#{@test_name} | grep IPAddress`
    fail unless result
    m = /"IPAddress": "(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"/.match(result)
    fail unless m.size == 2
    m[1]
  end

  def start_docker(cmd_in_docker, env = nil, workdir = nil)
    # First cleanup possible remnants of old runs
    stop_docker
    cmd = 'docker run --detach'
    cmd += " --env=#{env}" if env
    cmd += " --workdir=#{workdir}" if workdir
    cmd += " -v #{RootDir}:/home/elexis/"
    cmd += " --publish=#{local_ip}:6333:6333 --name=jubula-#{@test_name} ngiger/jubula_runner"
    cmd += ' ' + cmd_in_docker
    puts cmd
    system(cmd)
  end

  def exec_in_docker(command, env = nil, workdir = nil)
    cmd = 'docker exec --detach' # do it in the background
    cmd += " --env=#{env} " if env
    cmd += " --workdir=#{workdir}" if workdir
    cmd += " jubula-#{@test_name} "
    cmd += command
    puts cmd
    system(cmd)
  end

  def stop_docker
    system("docker kill jubula-#{@test_name}", true)
    system("docker rm jubula-#{@test_name}", true)
  end

  def initialize(test_name)
    @test_name = test_name
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

  def gen_wrapper_script(name)
    exe = get_full_file_path_or_fail(File.join(WorkDir, @test_params[:exe_name]))
    data_dir = File.join(WorkDir, 'data')
    if @docker
      data_dir = '/home/elexis/work/data'
      exe = '/home/elexis/work/' + @test_params[:exe_name]
    end
    doc = "export LANG=de_CH.UTF-8
export LANGUAGE=de_CH:de
 #{exe} -data #{data_dir} -config jubula-#{Date.today.strftime('%Y.%m.%d')} \
-vmargs #{@test_params[:aut_vmargs]}" #  2>&1 > /home/elexis/runner.log \n"
    File.open(name, 'w') do |f|
      f.puts '#!/bin/sh -v'
      f.puts(doc)
    end
    FileUtils.chmod(0755, name)
    puts "#{DRY_RUN ? 'Would create' : 'Created'} wrapper script #{name} with content #{doc}"
    if @docker
      @wrapper_file = '/home/elexis/work/' + File.basename(name)
    else
      @wrapper_file = get_full_file_path_or_fail(name)
    end
  end

  def ensure_presence_of_jubula
    @testexec = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'jubula/testexec'))
    @dbtool = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'jubula/dbtool'))
    @autagent = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autagent'))
    @stopautagent = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/stopautagent'))
    @autrun = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autrun'))
    puts "Found all tools to be able to run #{@test_xml}"
  end

  def prepare_jubula
    vers = Config[:jubula_version].to_s
    path = File.join(RootDir, 'definitions', "#{@test_name}*.xml")
    candidates = Dir.glob(path)
    fail "Could not find any file using #{path}" if candidates.size == 0 && !DRY_RUN
    @test_xml = candidates.last # this should open the latest version of the
    modules = [
      File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_swt_#{vers}.xml"),
      File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_concrete_#{vers}.xml"),
      File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_rcp_#{vers}.xml"),
      @test_xml
    ]
    modules.each { |m_path| get_full_file_path_or_fail(m_path) }
    creates = File.join(WorkDir, 'database/embedded.h2.db')
    modules.each do |m|
      get_full_file_path_or_fail(m)
      system("#{@dbtool} -data #{@jubula_test_data_dir} #{@jubula_test_db_params} -import #{m}")
      get_full_file_path_or_fail(creates)
    end unless File.exist?(creates)
  end

  def store_cmd(name, doc)
    path = File.join(RootDir, File.basename(name))
    File.open(path, 'w') do |f|
      f.puts '#!/bin/sh -v'
      f.puts(doc)
    end
    FileUtils.chmod(0755, path)
  end

  def start_autagent
    cmd = "#{@autagent} -l -p #{Config[:port_number]}"
    puts "Starting autagent with port #{Config[:port_number]}"
    if @docker
      start_cmd = 'Xvfb :1 -screen 5 1280x1024x24 -nolisten tcp'
      store_cmd('start_docker.sh', start_cmd)
      @docker.start_docker(start_cmd, 'DISPLAY=:1.5')
      store_cmd('start_autagent.sh', cmd + "\necho autagent started\nexit 0")
      @docker.exec_in_docker('/home/elexis/start_autagent.sh')
    else
      system(cmd + ' &')
    end
  end

  def start_aut
    work = WorkDir
    data_dir = File.join(work, 'jubula/datadir')
    data = File.join(work, 'jubula/data')
    [data, data_dir].each { |path| FileUtils.makedirs(path.sub('/home/elexis', WorkDir), verbose: true) }
    # aut_log_file = File.join(@docker ? '/home/elexis/results' :
    # FileJoin(WorkDir, 'results'), "#{@test_name}_aut.log")
    cmd = "cd #{File.dirname(@autrun)}
./#{File.basename(@autrun)} \
#{@test_params[:autrun_params]} \
--autagenthost #{@docker ? 'localhost' : 'localhost'} \
--autagentport #{Config[:port_number]} \
--exec #{@wrapper_file} &" # 2>&1 > #{aut_log_file}"
#--autagenthost #{@docker ? @docker.local_ip : 'localhost'} \
    puts "Starting autrun in 1 second: #{cmd}"
    sleep 1
    store_cmd('autrun.sh', cmd)
    @docker ? @docker.exec_in_docker('/home/elexis/autrun.sh') : system(cmd)
  end

  def run_test_exec
    results = File.join(RootDir, 'results')
    FileUtils.makedirs(results)
    # It must be possible to override all default arguments via the test.yaml!
    cmd = "#{@testexec} \
-server #{@docker ? @docker.docker_ip : 'localhost'} -port #{Config[:port_number]} \
-resultdir #{results} \
-datadir /tmp/jubula_data \
#{@jubula_test_db_params} \
#{@test_params[:testexec_params]} "
    puts "Starting testexec: #{cmd}"
    store_cmd('testexec.sh', cmd)
    system(cmd)
  end

  def stop_agent
    cmd = "#{@stopautagent} -p #{Config[:port_number]} -stop"
    if DONT_STOP
      puts "DONT_STOP: skip stopping autagent via #{cmd}"
    else
      sleep 1
      @docker ? @docker.exec_in_docker(cmd) : system(cmd)
    end
  end

  def run_prepared_jubula
    Dir.chdir(WorkDir)
    start_autagent
    sleep 1
    start_aut
    sleep 5
    run_test_exec
    stop_agent
  ensure
    if DONT_STOP
      puts "DONT_STOP: skip killing docker/exe"
    else
      @docker ? @docker.stop_docker : system("killall --quiet #{@test_params[:exe_name]}", MAY_FAIL)
    end
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
    Dir.chdir(WorkDir)
    ensure_presence_of_jubula
    prepare_jubula
    gen_wrapper_script(File.join(WorkDir, 'runner.bat'))
    run_prepared_jubula
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
    @rcp_support = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'rcp-support.zip'))
    Dir.chdir(File.join(WorkDir, 'plugins'))
    unzip(@rcp_support, 'org.eclipse.jubula.rc.rcp_*.jar')
    patch_ini_file_for_jubula_rc
  end
end

puts ARGV.inspect
if ARGV.index('docker_build')
  docker_build
  ARGV.delete('docker_build')
  exit if ARGV.size == 0
end

if ARGV.index('run_in_docker')
  @run_in_docker = true
  ARGV.delete('run_in_docker')
end

puts ARGV.inspect
ARGV.each do |a_test|
  puts a_test
  test = JubulaRunner.new(a_test)
  test.run_test_suite(@run_in_docker)
end
