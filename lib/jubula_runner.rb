require 'socket'
require 'common'
require 'docker_runner'
require 'version'

# This is a small helper class to run the Jubula tests for Elexis either
# * on the developers host with the AUT on the same machine
# * on the developers host with the AUT running inside a docker container
# * on the Jenkins-CI with the AUT running inside a docker container
# In all cases we assume that the correct Jubula executable is installed on the host
class JubulaRunner
  attr_reader :start_time, :jubula_test_db_params, :jubula_test_data_dir, :rcp_support, :test_params
  attr_reader :opts, :info_root, :info_today
  RESULT_DIR = 'results'

  def run(options, test_cases=ARGV)
    @opts = options
    ENV['JUBULA_RUNNER_VERSION'] ||= ElexisJubula::VERSION
    opts[:result_dir] ||= 'results'
    puts "#{opts[:variant]} #{test_cases.join(' ')} opts[:noop] is #{opts[:noop]} opts[:use_x11] #{opts[:use_x11]} RUN_IN_DOCKER #{opts[:run_in_docker]} opts[:medelexis] #{opts[:medelexis]} tag #{ENV['JUBULA_RUNNER_VERSION']}"
    fail "env JUBULA_RUNNER_VERSION must be defined" unless ENV['JUBULA_RUNNER_VERSION']
    res = 0
    if opts[:definition]
      name = "definitions/#{opts[:definition]}.yaml"
      fail "Could not find definition file #{name}" unless File.exist?(name)
      @opts.merge! YAML.load_file(name)
    end
    start_time = Time.now
    res = if opts[:aut_agent]
      puts "aut_agent not yet realized"
      res = -1
    elsif opts[:build_docker]
      res = docker_build
    elsif opts[:elexis]
      puts "elexis not yet realized"
      res = -2
    else
      test_cases.each do |a_test|
        setup_test_case(a_test)
        run_test_suite
      end
    end

    diff_seconds = (Time.now - start_time).to_i
    puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: took #{diff_seconds} seconds to run. Exit status 0 if #{res.inspect}"
    res
  end

  def get_h2_db_params(full_path)
    "-dburl 'jdbc:h2:#{full_path};MVCC=TRUE;AUTO_SERVER=TRUE;DB_CLOSE_ON_EXIT=FALSE' -dbuser 'sa' -dbpw ''"
  end

  def get_uniq_agent_port(opts)
    # Pick a random port for agent, which should not interfere with other parallel docker instances
    port = opts[:agent_port] || 6888
    test_suites = Dir.glob('jubula-tests/src/ch/ngiger/jubula/testsuites/*.java').sort
    index = test_suites.find_index{|name| /#{opts[:test_to_run]}.java/i.match(name) }
    fail "Could not find test_suite matching #{opts[:test_to_run]}" unless index
    port += index
    port += 10000 if opts[:medelexis]
    case opts[:variant]
    when /beta/
      port += 300
    when /^3.1-prerelease/
      port += 200
    when /^3.1/
      port += 100
    else
      # use default
    end
    puts "Checking for server on port #{port}"
    begin
      server = TCPServer.new('127.0.0.1', port)
    rescue Errno::EADDRINUSE
      puts "Cannot continue as there is already a process running on port #{port}"
      exit 2
    end
    server.close if server
    server = nil # release port
    puts "Using now #{port} index #{index} for Jubula autagent from test options #{opts[:agent_port]} #{opts[:variant]} opts[:medelexis] #{opts[:medelexis].inspect}"
    port
  end
  def run_test_in_docker
    res = false
    puts "run_test_in_docker from #{Dir.pwd}"
    FileUtils.rm_f('jubula-tests/AUT_run.log', verbose: true, :noop => opts[:noop]) if File.exist?('jubula-tests/AUT_run.log')
    @test_params[:environment].each do |v,k| cmd += "export #{v}=#{k}\n" end if @test_params[:environment]
    cmd  = %(
status=99
# /home/elexis/#{opts[:result_dir]} is mounted via docker-compose.yml
if test -f /home/elexis/.m2 ; then du -shx /home/elexis/.m2; else echo "no /home/elexis/.m2 (Okay for first time)"; fi
rm -rf /home/elexis/p2
mkdir -p /home/elexis/elexis/GlobalInbox
env | sort
export AGENT_PORT=#{@opts[:agent_port]}
export agent_port=#{@opts[:agent_port]}
grep elexis /etc/passwd
echo elexis should have UID #{ENV['HOST_UID']}
whoami
)
    if @opts[:medelexis]
      cmd += "\n find . -name '*license.xml'"
      cmd += "\n cp medelexis_jubula_license.xml /home/elexis/elexis/license.xml"
      cmd += "\necho Starting Medelexis SW-Installation\n ls -l /home/elexis/elexis/license.xml\n"
      cmd += "/app/install_sw_medelexis.rb /home/elexis/work/Medelexis #{opts[:variant]} /home/elexis/#{opts[:result_dir]} 2>&1 | tee /home/elexis/#{opts[:result_dir]}/install_sw_medelexis.log"
      cmd += "\necho  finished Medelexis SW-installation\n"
    end
    cmd += "#{@mvn_cmd}\n"
    begin
      puts "Starting HOST_UID is #{ENV['HOST_UID'].inspect} from process #{Process.uid.to_s} AGENT_PORT #{opts[:agent_port]} cmd: #{@opts[:entrypoint]}"
      res = @docker.run_cmd_in_docker(@opts[:entrypoint], cmd)
      sleep(0.5)
      result = File.join(RESULT_DIR, 'result_of_test_run')
      if !File.exist?(result)
        @exitValue = 999
        inhalt = "result_of_test_run not found"
      else
        inhalt = IO.readlines(result)
        @exitValue = File.exist?(result) && inhalt.first.to_i
      end
      puts "@exitValue #{@exitValue} res is #{@opts[:entrypoint]} is #{res} aus result #{result} mit Inhalt\n#{inhalt}"
    ensure
      # stop container if we were unable to copy the result and/or log files
      @docker.stop_docker
    end
    return(@exitValue ? 0 : 1)
  end

  def run_test_exec
    Dir.chdir(RootDir)
    File.join(RootDir, RESULT_DIR)
    @test_params[:environment].each do |v,k| ENV[v]=k end if @test_params[:environment]
    puts "Will run #{@mvn_cmd}"
    system(@mvn_cmd, :noop => opts[:noop])
  ensure
    system("killall --quiet #{@test_params[:exe_name]}", { :may_fail => true, :noop => opts[:noop]})
  end

  def show_configuration
    puts "Configuration is:\n#{Config}"
    puts "Testparams for #{@test_name} are:\n#{@test_params}"
  end

  def run_test_suite
    saved = Dir.pwd
    @test_params ||= @opts.clone
    @result_dir = File.join(RootDir, RESULT_DIR)
    FileUtils.makedirs(WorkDir, opts[:noop]) unless File.directory?(WorkDir)
    if opts[:run_in_docker]
      Dir.chdir(RootDir)
      @opts[:compose_file] = "wheezy/docker-compose.yml"
      @opts[:compose_project] = "jubula#{@opts[:agent_port]}"
      @opts[:docker_name] = "jenkinstest"
      @opts[:container_home] =  File.join(RootDir, 'container_home')
      @docker = DockerRunner.new(opts, @test_name, @result_dir)
      @elexis_log = "#{@docker.container_home}/elexis/logs/elexis-3.log"
      puts "trap_ctrl_c installed"
      DockerRunner.trap_ctrl_c(@docker, @opts)
    else
      @elexis_log = "#{Etc.getpwuid.dir}/elexis/logs/elexis-3.log"
      Dir.chdir(WorkDir)
    end
    if opts[:medelexis]
      source = File.join(ENV['HOME'], 'medelexis_jubula_license.xml')
      unless File.exist?(source)
        puts "For Medelexis test we need a valid license file under #{source}"
        return 1
      end
      dest = File.join((opts[:run_in_docker] ? @docker.container_home : '~'), 'medelexis_jubula_license.xml')
      opts[:noop] ? puts("cp #{source} #{dest}") : FileUtils.cp(source, dest, :verbose => true)
    end
    FileUtils.rm(@elexis_log, :noop => opts[:noop]) if File.exist?(@elexis_log)
    FileUtils.rm_rf(@result_dir, :noop => opts[:noop])
    FileUtils.makedirs(@result_dir, :noop => opts[:noop])
    # -offline does not work inside docker. Don't know why
    @mvn_cmd = "mvn clean integration-test -Dtest_to_run=#{@test_params[:test_to_run]}" # + ' -offline' #
    @mvn_cmd +=  " -DDISPLAY=#{@docker.display}" if opts[:run_in_docker]
    opts[:run_in_docker] ? run_test_in_docker : run_test_exec
  ensure
    puts "Ensure called run_in_docker #{opts[:run_in_docker]}"
    Dir.chdir(saved)
    @docker.stop_docker if opts[:run_in_docker] && @docker
    destination =  @result_dir + '-' + @test_params[:test_to_run]
    FileUtils.rm_rf(destination, :verbose => true, :noop => opts[:noop])
    FileUtils.mv(@result_dir, destination, verbose: true, noop: opts[:noop]) if File.exist?(@result_dir)
    FileUtils.cp(@elexis_log, destination, verbose: true, noop: opts[:noop], preserve: true)  if @elexis_log && File.exist?(@elexis_log)
    if opts[:run_in_docker] && @docker
      files = Dir.glob(File.join(@docker.container_home, '*/*/surefire-reports/*'))
      sure_dest = File.join(destination, 'surefire-reports')
      puts "Saving surefire-reports to #{sure_dest} #{files.join("\n")}"
      FileUtils.makedirs(sure_dest)
      FileUtils.cp_r(files, sure_dest, verbose: true, noop: opts[:noop], preserve: true) if files.size > 0
    end
    diff_time = (Time.now - @start_time).to_i
    puts "Total time #{diff_time / 60 }:#{sprintf('%02d', diff_time % 60)}. Result #{@exitValue == 0 ? 'SUCCESS' : opts[:noop] ? 'opts[:noop]' : 'FAILURE'}"
  end

  def setup_test_case(test2run)
    saved = Dir.pwd
    @test_name = test2run
    @start_time = Time.now
    @test_params = YAML.load_file(File.join(RootDir, 'definitions', "defaults.yaml"))
    test_definitions = File.join(RootDir, 'definitions', "#{@test_name}.yaml")
    @test_params.merge!(YAML.load_file(test_definitions)) if File.exist?(test_definitions)
    @test_params.merge!(opts)
    @test_params[:test_to_run] = test2run
    @opts[:entrypoint] = "/home/elexis/maven_#{test2run}.sh"
    @opts[:agent_port] = get_uniq_agent_port(@test_params)
    ENV['AGENT_PORT'] = @opts[:agent_port].to_s # for docker-compose.yml
    show_configuration if $VERBOSE || opts[:noop]
    if opts[:medelexis]
      glob_pattern = "*medelexis*application*.zip"
      return if opts[:noop]
      unless (medelexis = Dir.glob(glob_pattern)) && medelexis.size > 0
        puts "Unable to find Medelexis zip file via #{glob_pattern}"
        exit 1
      end
      zip_file = File.expand_path(medelexis.first)
      puts "Unpacking Medelexs zip file #{medelexis}"
      prepare_medelexis(Dir.pwd)
      FileUtils.rm_rf(WorkDir, :verbose => true, :noop => opts[:noop])
      FileUtils.makedirs(WorkDir, :verbose => true, :noop => opts[:noop])
      begin
        Dir.chdir(WorkDir)
        unzip(zip_file, File.join(WorkDir, 'Medelexis.ini'))
      ensure
        Dir.chdir(saved)
      end
    else
      unless File.directory?(File.join(WorkDir, 'plugins')) || @opts[:noop]
        $LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)), 'bin')
        require 'install_open_source_elexis.rb'
        install_opensource_elexis(@opts[:noop], @opts[:variant])
      end
    end
    @jubula_test_db_params = get_h2_db_params(File.join(WorkDir, 'database/embedded'))
    @jubula_test_data_dir  = File.join(WorkDir, 'database/data')
    install_rcp_support_for_jubula(WorkDir)
    patch_ini_file_for_jubula_rc(WorkDir)
  ensure
    Dir.chdir(saved)
  end
end

