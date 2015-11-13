#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'
require 'socket'

class DockerRunner
  # http://stackoverflow.com/questions/14112955/how-to-get-my-machines-ip-address-from-ruby-without-leveraging-from-other-ip-ad
  def local_ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily
    UDPSocket.open do |s|
      s.connect '192.168.1.1', 1
      s.addr.last
    end
  ensure
    Socket.do_not_reverse_lookup = orig
  end

  def start_docker(cmd_in_docker, env = nil)
    # First cleanup possible remnants of old runs
    stop_docker
    cmd = 'docker run --detach'
    cmd += " --env=DISPLAY=:1.5 " # if env
    cmd += " -v #{RootDir}:/home/elexis/"
#    cmd += " --name=jubula-#{@test_name} ngiger/jubula_runner #{cmd_in_docker}"
    cmd += " --publish=#{local_ip}:6333:6333 --name=jubula-#{@test_name} ngiger/jubula_runner #{cmd_in_docker}"
#    cmd += " --hostname=jubula-#{@test_name} --name=jubula-#{@test_name} ngiger/jubula_runner #{cmd_in_docker}"
    puts cmd
    system(cmd)
  end

  def exec_in_docker(command)
    cmd = "docker exec jubula-#{@test_name} #{command}"
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
      data_dir ='/home/elexis/work/data'
      exe = '/home/elexis/work/' + @test_params[:exe_name]
    end
    doc = "#!/bin/sh \n#{exe} -data #{data_dir} -config jubula-#{Date.today.strftime('%Y.%m.%d')} \
-vmargs #{@test_params[:aut_vmargs]}\n"
    File.open(name, 'w') { |f| f.puts(doc) }
    FileUtils.chmod(0755, name)
    puts doc
    puts "#{DRY_RUN ? 'Would create' : 'Created'} wrapper script #{name} with content #{doc}"
    if @docker
      @wrapper_file = '/home/elexis/work/' + File.basename(name)
    else
      @wrapper_file = get_full_file_path_or_fail(name)
    end
  end

  def prepare_jubula
    vers = Config[:jubula_version].to_s
    path = File.join(RootDir, 'definitions', "#{@test_name}*.xml")
    candidates = Dir.glob(path)
    unless candidates.size > 0
      puts "Could not find any file using #{path}"
      exit 2
    end
    test_xml = candidates.last # this should open the latest version of the
    modules = [
      File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_swt_#{vers}.xml"),
      File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_concrete_#{vers}.xml"),
      File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_rcp_#{vers}.xml"),
      test_xml
    ]
    modules.each { |m_path| get_full_file_path_or_fail(m_path) }
    @testexec = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'jubula/testexec'))
    @dbtool = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'jubula/dbtool'))

    @autagent = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autagent'))
    @stopautagent = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/stopautagent'))
    @autrun = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autrun'))

    puts "Found all tools to be able to run #{test_xml}"
    creates = File.join(WorkDir, 'database/embedded.h2.db')
    modules.each do |m|
      get_full_file_path_or_fail(m)
      system("#{@dbtool} -data #{@jubula_test_data_dir} #{@jubula_test_db_params} -import #{m}")
      get_full_file_path_or_fail(creates)
    end unless File.exist?(creates)
  end

  def run_prepared_jubula
    Dir.chdir(WorkDir)
    threads = []
    begin # threads << Thread.new do
      cmd = "#{@autagent} -l -p #{Config[:port_number]}"
      puts "Starting autagent with port #{Config[:port_number]}"
#      @docker.start_docker("Xvfb :1 -screen 0 280x1024x24  -nolisten tcp ") if @docker
      @docker.start_docker('Xvfb :1 -screen 5 1280x1024x24 -nolisten tcp') if @docker
#      @docker.start_docker('') if @docker # .bashrc start Xvfb and set DISPLAY=:1.5
      @docker ? @docker.exec_in_docker(cmd + ' &') : system(cmd + ' &')
      byebug
    end
    sleep 1

    begin # threads << Thread.new do
      aut_log_file = File.join(ResultDir, "#{@test_name}_aut.log")
      cmd = "#{@autrun} #{@test_params[:autrun_params]} --autagentport #{Config[:port_number]} \
--exec #{@docker ? '/bin/sh' : ''} #{@wrapper_file} & 2>&1 > #{aut_log_file}"
      puts "Starting autrun in 1 second: #{cmd}"
# this works on the container (either Elexis3 or runner.bat )
# /opt/jubula_8.2.0.021/server/autrun --kblayout de_CD --autid elexis -rcp --autagentport 6333 --exec /home/elexis/work/Elexis3

      # /opt/jubula_8.2.0.021/server/autrun --kblayout de_CD --autid elexis -rcp --autagentport 6333 --exec /bin/sh /opt/src/elexis-jubula/work/runner.bat
      sleep 1
      # @docker ? @docker.exec_in_docker(cmd) : system(cmd)
      system(cmd)
    end

    data_dir = File.join(WorkDir, 'jubula/datadir')
    data = File.join(WorkDir, 'jubula/data')
    [data, data_dir, ResultDir].each { |path| FileUtils.makedirs(path, verbose: true) unless File.directory?(path) }
    begin # threads << Thread.new do
      test_exe_log_file = File.join(ResultDir, "#{@test_name}_test_exe.log")
      this_worked = %(
/opt/jubula_8.2.0.021/jubula/testexec \
--server 172.17.0.244  --port 6333 \
-resultdir /opt/src/elexis-jubula/results \
-datadir elexis/datadir \
-data elexis/data \
-dburl 'jdbc:h2:/opt/src/elexis-jubula/work/database/embedded;MVCC=TRUE;AUTO_SERVER=TRUE;DB_CLOSE_ON_EXIT=FALSE' -dbuser 'sa' -dbpw '' \
-autid elexis -version 1.0 -language en_US -project Screenshot -testsuite ScreenSuite
)
      # It must be possible to override all default arguments via the test.yaml!
      cmd = "#{@testexec} -port #{Config[:port_number]} -server localhost \
-resultdir #{ResultDir} \
-datadir #{data_dir} \
-data #{data} \
#{@jubula_test_db_params} \
#{@test_params[:testexec_params]} \
2>&1 | /usr/bin/tee #{test_exe_log_file}"
      sleep 1.5
      puts "Starting testexec: #{cmd}"
      File.open(File.join(WorkDir, 'testexec.tmp'), 'w+') { |f| f.puts cmd }
      system(cmd)

      cmd = "#{@stopautagent} -p #{Config[:port_number]} -stop"
      puts "Stopping in 1 second autagent via #{cmd}"
      sleep 1
      system(cmd)
      @docker ? @docker.exec_in_docker(cmd) : system(cmd)
    end
    threads.join if threads.size > 0
  ensure
     @docker ? @docker.stop_docker : system("killall --quiet #{@test_params[:exe_name]}")
  end

  def show_configuration
    puts "Configuration is:\n#{Config}"
    puts "Testparams for #{test2run} are:\n#{@test_params}"
  end

  def run_test_suite(use_docker = false)
    @docker  = DockerRunner.new(@test_name) if use_docker
    saved_dir = Dir.pwd
    FileUtils.makedirs(WorkDir) unless File.directory?(WorkDir)
    Dir.chdir(WorkDir)
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
