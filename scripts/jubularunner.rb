#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'socket'
require 'tmpdir'
require 'etc'
require 'trollop'

$need_to_stop_docker = true

def get_unused_agent_port(opts)
  # Pick a random port for agent, which should not interfere with other parallel docker instances
  port = opts[:agent_port] || 6888
  port += 10000 if opts[:medelexis]
  case opts[:variant]
  when /beta/
    port += 300
  when /prerelease/
    port += 200
  when /^release/
    port += 100
  else
    # use default
  end
  begin
    server = TCPServer.new('127.0.0.1', port)
  rescue Errno::EADDRINUSE
    puts "port was used. Will try next one"
    port = port +1
    retry
  end
  server.close
  server = nil # release port
  puts "Using now #{port} for Jubula autagent from test options #{opts[:agent_port]} #{opts[:variant]} RUN_MEDELEXIS #{opts[:medelexis].inspect}"
  port
end

# Helper class to use docker for the Jubula AUT
class DockerRunner
  attr_reader :container_home, :start_with
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
    puts "cmd_in_docker #{cmd_in_docker} with uid #{ENV['HOST_UID']}"
    [ # instead of calling build, create, start we can use compose up -d
      # Only possibility to make it work under compose 1.8
      @start_with + 'build', # ensure that a changed Dockerfile gets rebuilt
      @start_with + 'up -d', # create and start do not create a network with compose 1.8, up -d does
      # TODO: How to run several instances of jenkinstest in parallel
      # using docker-compose scale and exec --index
      # added -T to work around bug https://github.com/docker/compose/pull/4059
      @start_with + "exec -T --user elexis #{@docker_name} #{cmd_in_docker}",
    ].each do |cmd|
      sleep 2; puts "start_docker #{cmd}"
      if @test_name.eql?('build_docker')
        res = system(cmd, MAY_FAIL) if /build/i.match(cmd)
      else
        res = system(cmd, MAY_FAIL)
      end
    end
  end

  def stop_docker
    # puts "stop_docker was called $need_to_stop_docker is #{$need_to_stop_docker}"
    return unless $need_to_stop_docker
    cmd =  @start_with + "logs --no-color --timestamps > #{@result_dir}/containers.log"
    puts "Saving container logs using #{cmd}"
    system(cmd, MAY_FAIL)
    @stop_commands.each do |cmd| res = system(cmd, MAY_FAIL) end
    $need_to_stop_docker = false
  end

  def initialize(test_name, result_dir, agent_port)
    ENV['HOST_UID'] = Process.uid.to_s
    @test_name = test_name
    @result_dir = result_dir
    # TODO: Fix running tests in parallel
    @docker_name = "jenkinstest" # this did work when calling docker directly "jubula-#{@test_name}-#{ENV['VARIANT']}"
    @container_home = File.join(RootDir, 'container_home')
    @m2_repo = File.join(RootDir, 'container_home_m2')
    FileUtils.makedirs(@m2_repo, :verbose => true)
    @project_name = 'jubula'+agent_port.to_s
    @start_with = "docker-compose -f #{RootDir}/wheezy/docker-compose.yml --project-name #{@project_name} "
    if @test_name.eql?('build_docker')
      @cleanup_networks = []
      @stop_commands = []
    else
      @cleanup_networks =  "docker network rm  #{@project_name}_public 2>/dev/null; sleep 1; docker network rm  #{@project_name}_private 2>/dev/null"
      @stop_commands = ["#{@start_with} stop", "#{@start_with} rm --force --all", @cleanup_networks]
    end
    # cleanup stale docker containers
    @stop_commands.each do |cmd| res = system(cmd, MAY_FAIL) end
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

  def store_cmd(name, cmd)
    path = File.join(@docker ? @docker.container_home : RootDir, File.basename(name))
    FileUtils.makedirs(File.dirname(path))
    File.open(path, 'w') do |f|
      f.puts '#!/bin/sh -v'
      f.puts(cmd)
    end
    FileUtils.chmod(0755, path, verbose: true)
    FileUtils.cp(path, RootDir, :preserve => true, :verbose => true)
    system("ls -l #{path}")
    puts Dir.pwd
  end

  def prepare_docker
    @docker.stop_docker # cleanup from previous runs if any
    $need_to_stop_docker = true
    at_exit do  @docker.stop_docker end
    tmp_dest_dir = File.join(RootDir, 'tmp.to_be_deleted')
    puts "tmp_dest_dir is #{tmp_dest_dir}"
    FileUtils.makedirs(tmp_dest_dir)
    if File.exists?(@docker.container_home)
      FileUtils.mv(@docker.container_home, "#{tmp_dest_dir}/#{Time.now.strftime('%Y%m%d%H%M%s')}", verbose: true)
      fail "Must be possible to remove container_home #{@docker.container_home}" if File.exist?(@docker.container_home)
      FileUtils.rm_rf(tmp_dest_dir)
    end
    FileUtils.makedirs(@docker.container_home)
    [ 'pom.xml', 'jubula-target', 'jubula-tests', 'org.eclipse.jubula.product.autagent.start'].each do |item|
      FileUtils.cp_r(File.join(RootDir, item), @docker.container_home, verbose: true, noop: DRY_RUN, preserve: true)
    end
    FileUtils.cp_r(WorkDir, File.join(@docker.container_home, 'work'), verbose: true, noop: DRY_RUN, preserve: true)
  end

  def run_test_in_docker
    checks = [ '/tmp/.X11-unix', '/dev/snd' ]
    if USE_X11 # needs also changes in docker-compose.yml!
      # Thanks to jess Fraznelle https://blog.jessfraz.com/post/docker-containers-on-the-desktop/
      @display = ENV['DISPLAY']
      checks.each do |needed_for_x|
        cmd = "#{@docker.start_with} config | /bin/grep #{needed_for_x}"
        unless system(cmd, MAY_FAIL)
          puts "\n\n-----------\n\n"
          puts "If you want to make USE_X11 work correctly, you must add definitions"
          puts "for #{checks} into docker-compose.yaml"
          puts "\n\n-----------\n\n"
          exit 4
        end
      end
      puts "Activating USE_X11 for DISPLAY #{@display}"
    else
      checks.each do |needed_for_x|
        cmd = "#{@docker.start_with} config | /bin/grep #{needed_for_x}"

        if (res = `#{cmd}`) && res.length > 0
          puts "\n\n-----------\n\n"
          puts "If must remove the definitions for #{checks} in docker-compose.yaml"
          puts "   or Xvfb will not work correctly!"
          puts "\n\n-----------\n\n"
          exit 4
        end
      end
      @display = ':1.5' # as defined below for Xvfb
    end
    prepare_docker
    res = false
    if RUN_MEDELEXIS
      source = File.join(ENV['HOME'], 'medelexis_jubula_license.xml')
      unless File.exist?(source)
        puts "For Medelexis test we need a valid license file under #{source}"
        exit 1
      end
      prepare_docker
      dest = File.join(@docker.container_home, 'medelexis_jubula_license.xml')
      FileUtils.cp(source, dest, :verbose => true)
    else
      prepare_docker
    end
    puts "run_test_in_docker from #{Dir.pwd}"
    FileUtils.rm_f('jubula-tests/AUT_run.log', verbose: true) if File.exist?('jubula-tests/AUT_run.log')
    cmd = "status=99\n"
    cmd_name = '/home/elexis/testexec.sh'
    @test_params[:environment].each do |v,k| cmd += "export #{v}=#{k}\n" end if @test_params[:environment]
    cmd += %(export LANG=de_CH.UTF-8
export LANGUAGE=de_CH
export DISPLAY=#{@display}
export VARIANT=#{ENV['VARIANT']}
export AGENT_PORT=#{@test_params[:agent_port]}
Xvfb :1 -screen 5 1600x1280x24 -nolisten tcp &
echo "I am" `whoami`: `id`

# idea from https://gist.github.com/tullmann/476cc71169295d5c3fe6
echo `date`: waiting for Xserver to be ready
MAX=120 # About 60 seconds
CT=0
while ! xdpyinfo >/dev/null 2>&1; do
    sleep 0.50s
    CT=$(( CT + 1 ))
    if [ "$CT" -ge "$MAX" ]; then
        echo "FATAL: $0: Gave up waiting for X server $DISPLAY"
        exit 11
    fi
done
echo `date`: Xserver on display #{@display} seems to be ready

)
     cmd += %(
/usr/bin/metacity --replace --sm-disable &
sleep 1
/usr/bin/metacity-message disable-keybindings
) unless USE_X11
  cmd  += %(/usr/bin/xclock -digital -twentyfour & # Gives early feedback, that X is running
# /home/elexis/results is mounted via docker-compose.yml
cp $0 /home/elexis/results
du -shx /home/elexis/.m2/repository
rm -rf /home/elexis/p2
mkdir -p /home/elexis/elexis/GlobalInbox
env | sort
#{@medelexis_script}
#{@start_jubula}
date
ps -ef
#{@mvn_cmd} -DDISPLAY=#{@display}
date
pwd
find $PWD -name surefire-reports | xargs ls -lrt
ps -ef
export status=$?
echo saved status $status for #{@mvn_cmd}
echo $status | tee /home/elexis/results/result_of_test_run
echo Resultat von #{@test_params[:test_to_run]} um `date` war $status | tee --append /home/elexis/results/result_of_test_run
cat /home/elexis/results/result_of_test_run
ls -l /home/elexis/results/result_of_test_run
# sleep 3600 # some time for debugging
sync # ensure that everything is written to the disk
sleep 1
ps -ef
echo killing children process
pkill -P $$
echo about to exit with status $status
exit $status
)
    store_cmd(cmd_name, cmd)
    # http://support.xored.com/support/solutions/articles/3000028645
    # https://www.eclipse.org/forums/index.php?t=msg&th=440461&goto=987043&#msg_987043
    # Had window activation problem with Xvfb with or without awesome
    # with startx this did not gow
    system('xhost local:root') if @docker && USE_X11
    begin
      puts "Starting HOST_UID is #{ENV['HOST_UID'].inspect} from process #{Process.uid.to_s} AGENT_PORT #{ENV['AGENT_PORT']} cmd: #{cmd_name}"
      res = @docker.start_docker(cmd_name)
      sleep(0.5)
      result = File.join(@result_dir, 'result_of_test_run')
      if !File.exist?(result)
        @exitValue = 999
        inhalt = "result_of_test_run not found"
      else
        inhalt = IO.readlines(result)
        @exitValue = File.exist?(result) && inhalt.first.to_i
      end
      puts "@exitValue #{@exitValue} res is #{cmd_name} is #{res} aus result #{result} mit Inhalt\n#{inhalt}"
      if res && /smoketest|medelexis/i.match(@test_params[:test_to_run])
        puts "smoketest: Copy newly installed plugins for further tests back"
        FileUtils.cp_r(Dir.glob(File.join(@docker.container_home, 'work/*')), WorkDir, verbose: true)
      else
        puts "Skip copying plugins as testsuite #{@test_params[:test_to_run]} != smoketest"
      end
    ensure
      # stop container if we were unable to copy the result and/or log files
      @docker.stop_docker
    end
    exit @exitValue ? 0 : 1
  end

  def run_test_exec
    File.join(RootDir, 'results')
    @test_params[:environment].each do |v,k| ENV[v]=k end if @test_params[:environment]
    puts "Will run #{@mvn_cmd}"
    system(@mvn_cmd)
  ensure
    system("killall --quiet #{@test_params[:exe_name]}", MAY_FAIL)
  end

  def show_configuration
    puts "Configuration is:\n#{Config}"
    puts "Testparams for #{@test_name} are:\n#{@test_params}"
  end

  def run_test_suite(use_docker)
    @result_dir = File.join(RootDir, 'results')
    FileUtils.makedirs(WorkDir) unless File.directory?(WorkDir)
    if use_docker
      Dir.chdir(RootDir)
      @docker = DockerRunner.new(@test_name, @result_dir, @test_params[:agent_port])
      @elexis_log = "#{@docker.container_home}/elexis/logs/elexis-3.log"
    else
      @elexis_log = "#{Etc.getpwuid.dir}/elexis/logs/elexis-3.log"
      Dir.chdir(WorkDir)
    end
    FileUtils.rm @elexis_log if File.exist?(@elexis_log)
    FileUtils.rm_rf(@result_dir)
    FileUtils.makedirs(@result_dir)
    # -offline does not work inside docker. Don't know why
    @mvn_cmd = "mvn clean integration-test -Dtest_to_run=#{@test_params[:test_to_run]}" # + ' -offline' #
    trap("SIGINT") do
      puts "\n\n----- ctrl_c catched-----\n\n"
      sleep(1)
      @docker.stop_docker
      puts "ctrl_c catcher finished"
      exit(3)
    end
    @docker ? run_test_in_docker : run_test_exec
  ensure
    @docker.stop_docker if @docker
    destination =  @result_dir + '-' + @test_params[:test_to_run]
    FileUtils.rm_rf(destination, :verbose => true)
    FileUtils.cp_r(@result_dir, destination, verbose: true, noop: DRY_RUN, preserve: true) if File.exist?(@result_dir)
    FileUtils.cp(@elexis_log, destination, verbose: true, noop: DRY_RUN, preserve: true)  if @elexis_log && File.exist?(@elexis_log)
    if @docker
      files = Dir.glob(File.join(@docker.container_home, '*/*/surefire-reports/*'))
      sure_dest = File.join(destination, 'surefire-reports')
      puts "Saving surefire-reports to #{sure_dest} #{files.join("\n")}"
      FileUtils.makedirs(sure_dest)
      FileUtils.cp_r(files, sure_dest, verbose: true, noop: DRY_RUN, preserve: true)
      FileUtils.cp_r(files, @result_dir, verbose: true, noop: DRY_RUN, preserve: true)
    end
    diff_time = (Time.now - @start_time).to_i
    puts "Total time #{diff_time / 60 }:#{sprintf('%02d', diff_time % 60)}. Result #{@exitValue == 0 ? 'SUCCESS' : DRY_RUN ? 'DRY_RUN' : 'FAILURE'}"
  end

  def initialize(test2run, opts)
    @test_name = test2run
    @start_time = Time.now
    @test_params = YAML.load_file(File.join(RootDir, 'definitions', "defaults.yaml"))
    test_definitions = File.join(RootDir, 'definitions', "#{@test_name}.yaml")
    @test_params.merge!(YAML.load_file(test_definitions)) if File.exist?(test_definitions)
    @test_params.merge!(opts)
    @test_params[:test_to_run] ||= test2run
    @test_params[:agent_port] = get_unused_agent_port(@test_params)
    ENV['AGENT_PORT'] = @test_params[:agent_port].to_s # for docker-compose.yml
    show_configuration if $VERBOSE || DRY_RUN
    if RUN_MEDELEXIS
      glob_pattern = "*medelexis*application*.zip"
      unless (medelexis = Dir.glob(glob_pattern)) && medelexis.size > 0
        puts "Unable to find Medelexis zip file via #{glob_pattern}"
        exit 1
      end
      zip_file = File.expand_path(medelexis.first)
      puts "Unpacking Medelexs zip file #{medelexis}"
      prepare_medelexis(Dir.pwd)
      @medelexis_script = "/app/install_sw_medelexis.rb /home/elexis/work/Medelexis #{VARIANT} /home/elexis/results 2>&1 | tee /home/elexis/results/install_sw_medelexis.log "
      @start_jubula = '/app/start_jubula.rb localhost 8752 2>&1 | /usr/bin/tee --append /home/elexis/results/start_jubula.log &'
      FileUtils.rm_rf(WorkDir, :verbose => true)
      FileUtils.makedirs(WorkDir, :verbose => true)
      saved = Dir.pwd
      begin
        Dir.chdir(WorkDir)
        unzip(zip_file, File.join(WorkDir, 'Medelexis.ini'))
      ensure
        Dir.chdir(saved)
      end
    else
      require 'install_open_source_elexis.rb' unless File.directory?(File.join(WorkDir, 'plugins'))
    end
    @jubula_test_db_params = get_h2_db_params(File.join(WorkDir, 'database/embedded'))
    @jubula_test_data_dir  = File.join(WorkDir, 'database/data')
    install_rcp_support_for_jubula(WorkDir)
    patch_ini_file_for_jubula_rc(WorkDir)
  end
end

opts = Trollop::options do
  version = "JubulaRunner 0.1 (c) by Niklaus Giger <niklaus.giger@member.fsf.org>"
  banner <<-EOS
Useage:
  * Run Jubula  GUI tests for Elexis
  * Run Elexis and/or Jubula AUT-agent inside the docker
  * Specify one or more tests to be run (unless autagent, build_docker or elexis given)
  * Parameters for each test are given in definitions/<testname>.yaml, overriding those from definitions/default.yaml
  * Results of each test are saved (with surefire reports) under results and results-<testname>
EOS
  opt :dry_run,       "Dry-Run. Show configuration and commands without exectuing them", :default => false
  opt :use_x11,       "Force to use your display when running. Patches wheezy/docker-compose.yml, too. Handy to debug problems."
  opt :build_docker,  "Build the docker image needed"
  opt :elexis,        "Run Elexis inside the docker"
  opt :aut_agent,     "Start autagent for Jubula inside the docker"
  opt :run_in_docker, "Run maven inside docker, not on the command line", :default => true
  opt :medelexis,     "Test Medelexis (not Elexis3) app"
  opt :variant,       "Possible values are snapshot, beta, prerelease, release", :type => String, :default => 'snapshot'
end

DRY_RUN = opts[:dry_run]
USE_X11 = opts[:use_x11]
VARIANT = opts[:variant]
RUN_MEDELEXIS = opts[:medelexis]
RUN_AUT_AGENT = opts[:aut_agent]
require 'common'

puts "#{VARIANT} #{ARGV.join(' ')} DRY_RUN is #{DRY_RUN} USE_X11 #{USE_X11} RUN_IN_DOCKER #{opts[:run_in_docker]} RUN_MEDELEXIS #{RUN_MEDELEXIS}"

if opts[:aut_agent]
  puts "aut_agent not yet realized"
elsif opts[:build_docker]
  docker_build
elsif opts[:elexis]
  puts "elexis not yet realized"
else
  ARGV.each do |a_test|
    test = JubulaRunner.new(a_test, opts)
    test.run_test_suite(opts[:run_in_docker])
  end
end
