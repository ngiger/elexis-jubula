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
  attr_reader :opts, :start_time, :info_root, :info_today

  def run(options)
    @opts = options
    ENV['HOST_UID'] = Process.uid.to_s
    ENV['JUBULA_RUNNER_VERSION'] = ElexisJubula::VERSION
    puts "#{opts[:variant]} #{ARGV.join(' ')} opts[:noop] is #{opts[:noop]} opts[:use_x11] #{opts[:use_x11]} RUN_IN_DOCKER #{opts[:run_in_docker]} opts[:medelexis] #{opts[:medelexis]} tag #{ENV['JUBULA_RUNNER_VERSION']}"
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
      docker_build
    elsif opts[:elexis]
      puts "elexis not yet realized"
      res = -2
    else
      ARGV.each do |a_test|
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
    puts "Using now #{port} for Jubula autagent from test options #{opts[:agent_port]} #{opts[:variant]} opts[:medelexis] #{opts[:medelexis].inspect}"
    port
  end

  def store_cmd(name, cmd)
    path = File.join(@docker ? @docker.container_home : RootDir, File.basename(name))
    FileUtils.makedirs(File.dirname(path), :noop => opts[:noop])
    File.open(path, 'w') do |f|
      f.puts '#!/bin/sh -v'
      f.puts(cmd)
    end
    FileUtils.chmod(0755, path, verbose: true, :noop => opts[:noop])
    FileUtils.cp(path, RootDir, :preserve => true, :verbose => true, :noop => opts[:noop])
    system("ls -l #{path}", :noop => opts[:noop])
    puts Dir.pwd
  end

  def prepare_docker
    @docker.stop_docker # cleanup from previous runs if any
    $need_to_stop_docker = true
    at_exit do @docker.stop_docker end
    tmp_dest_dir = File.join(RootDir, 'tmp.to_be_deleted')
    puts "tmp_dest_dir is #{tmp_dest_dir}"
    FileUtils.makedirs(tmp_dest_dir, :noop => opts[:noop])
    if File.exists?(@docker.container_home) && !opts[:noop]
      FileUtils.mv(@docker.container_home, "#{tmp_dest_dir}/#{Time.now.strftime('%Y%m%d%H%M%s')}", verbose: true)
      fail "Must be possible to remove container_home #{@docker.container_home}" if File.exist?(@docker.container_home)
      FileUtils.rm_rf(tmp_dest_dir)
    end
    FileUtils.makedirs(@docker.container_home, :noop => opts[:noop])
    [ 'pom.xml', 'jubula-target', 'jubula-tests', 'org.eclipse.jubula.product.autagent.start'].each do |item|
      FileUtils.cp_r(File.join(RootDir, item), @docker.container_home, verbose: true, noop: opts[:noop], preserve: true)
    end
    FileUtils.cp_r(WorkDir, File.join(@docker.container_home, 'work'), verbose: true, noop: opts[:noop], preserve: true)
  end

  def check_compose_for_x11
    checks = [ '/tmp/.X11-unix', '/dev/snd' ]
    if opts[:use_x11] # needs also changes in docker-compose.yml!
      # Thanks to jess Fraznelle https://blog.jessfraz.com/post/docker-containers-on-the-desktop/
      @display = ENV['DISPLAY']
      checks.each do |needed_for_x|
        cmd = "#{@docker.start_with} config | /bin/grep #{needed_for_x}"
        unless system(cmd,  { :may_fail => true })
          puts "\n\n-----------\n\n"
          puts "If you want to make USE_X11 work correctly, you must add definitions"
          puts "for #{checks} into docker-compose.yaml"
          puts "\n\n-----------\n\n"
          binding.pry
          return 4
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
          return 4
        end
      end
    end
  end
  def adapt_compose_for_x11
    compose_yaml = File.join(RootDir, 'wheezy', 'docker-compose.yml')
    inhalt = IO.readlines(compose_yaml); 3
    if opts[:use_x11] # needs also changes in docker-compose.yml!
      inhalt.each{|line|line.sub!(/^(\s+)# (.+)(#.+USE_X11\n)/, '\1\2\3')}.compact; 3
      File.open(compose_yaml, 'w+'){|f| f.write(inhalt.join("")) }
      system('git diff -w wheezy', :noop => opts[:noop])
      @display = ENV['DISPLAY']
      puts "Activating USE_X11 for DISPLAY #{@display}"
    else
      puts "rollback"
      inhalt.each{|line| line.sub!(/^(\s+)([^#].*USE_X11\n)/,'\1# \2') unless /\s+#.+(#.+USE_X11\n)/.match(line)};2
      File.open(compose_yaml, 'w+'){|f| f.write(inhalt.join("")) }
      system('git diff -w wheezy', { :noop => opts[:noop]})
      @display = ':1.5' # as defined below for Xvfb
    end
  end
  def run_test_in_docker
    prepare_docker
    res = false
    adapt_compose_for_x11
    check_compose_for_x11
    if opts[:medelexis]
      source = File.join(ENV['HOME'], 'medelexis_jubula_license.xml')
      unless File.exist?(source)
        puts "For Medelexis test we need a valid license file under #{source}"
        return 1
      end
      prepare_docker
      dest = File.join(@docker.container_home, 'medelexis_jubula_license.xml')
      opts[:noop] ? puts("cp #{source} #{dest}") : FileUtils.cp(source, dest, :verbose => true)
    else
      prepare_docker
    end
    puts "run_test_in_docker from #{Dir.pwd}"
    FileUtils.rm_f('jubula-tests/AUT_run.log', verbose: true, :noop => opts[:noop]) if File.exist?('jubula-tests/AUT_run.log')
    cmd = "status=99\n"
    cmd_name = '/home/elexis/testexec.sh'
    @test_params[:environment].each do |v,k| cmd += "export #{v}=#{k}\n" end if @test_params[:environment]
    cmd += %(export LANG=de_CH.UTF-8
export LANGUAGE=de_CH
export DISPLAY=#{@display}
export VARIANT=#{opts[:variant]}
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
) unless opts[:use_x11]
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
    system('xhost local:root', :noop => opts[:noop]) if @docker && opts[:use_x11]
    begin
      puts "Starting HOST_UID is #{ENV['HOST_UID'].inspect} from process #{Process.uid.to_s} AGENT_PORT #{ENV['AGENT_PORT']} cmd: #{cmd_name}"
      res = @docker.start_docker(cmd_name)
      sleep(0.5, :noop => opts[:noop])
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
        FileUtils.cp_r(Dir.glob(File.join(@docker.container_home, 'work/*')), WorkDir, verbose: true, :noop => opts[:noop])
      else
        puts "Skip copying plugins as testsuite #{@test_params[:test_to_run]} != smoketest"
      end
    ensure
      # stop container if we were unable to copy the result and/or log files
      @docker.stop_docker
    end
    return(@exitValue ? 0 : 1)
  end

  def run_test_exec
    File.join(RootDir, 'results')
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
    @test_params ||= @opts.clone
    @result_dir = File.join(RootDir, 'results')
    FileUtils.makedirs(WorkDir, opts[:noop]) unless File.directory?(WorkDir)
    if opts[:run_in_docker]
      Dir.chdir(RootDir)
      @docker = DockerRunner.new(@test_name, @result_dir, @test_params[:agent_port], opts[:noop])
      @elexis_log = "#{@docker.container_home}/elexis/logs/elexis-3.log"
    else
      @elexis_log = "#{Etc.getpwuid.dir}/elexis/logs/elexis-3.log"
      Dir.chdir(WorkDir)
    end
    FileUtils.rm(@elexis_log, :noop => opts[:noop]) if File.exist?(@elexis_log)
    FileUtils.rm_rf(@result_dir, :noop => opts[:noop])
    FileUtils.makedirs(@result_dir, :noop => opts[:noop])
    # -offline does not work inside docker. Don't know why
    @mvn_cmd = "mvn clean integration-test -Dtest_to_run=#{@test_params[:test_to_run]}" # + ' -offline' #
    trap("SIGINT") do
      puts "\n\n----- ctrl_c catched-----\n\n"
      sleep(1, :noop => opts[:noop])
      @docker.stop_docker
      puts "ctrl_c catcher finished"
      exit(3)
    end
    @docker ? run_test_in_docker : run_test_exec
  ensure
    @docker.stop_docker if @docker
    destination =  @result_dir + '-' + @test_params[:test_to_run]
    FileUtils.rm_rf(destination, :verbose => true, :noop => opts[:noop])
    FileUtils.cp_r(@result_dir, destination, verbose: true, noop: opts[:noop], preserve: true) if File.exist?(@result_dir)
    FileUtils.cp(@elexis_log, destination, verbose: true, noop: opts[:noop], preserve: true)  if @elexis_log && File.exist?(@elexis_log)
    if @docker
      files = Dir.glob(File.join(@docker.container_home, '*/*/surefire-reports/*'))
      sure_dest = File.join(destination, 'surefire-reports')
      puts "Saving surefire-reports to #{sure_dest} #{files.join("\n")}"
      FileUtils.makedirs(sure_dest)
      FileUtils.cp_r(files, sure_dest, verbose: true, noop: opts[:noop], preserve: true)
      FileUtils.cp_r(files, @result_dir, verbose: true, noop: opts[:noop], preserve: true)
    end
    diff_time = (Time.now - @start_time).to_i
    puts "Total time #{diff_time / 60 }:#{sprintf('%02d', diff_time % 60)}. Result #{@exitValue == 0 ? 'SUCCESS' : opts[:noop] ? 'opts[:noop]' : 'FAILURE'}"
  end

  def setup_test_case(test2run)
    @test_name = test2run
    @start_time = Time.now
    @test_params = YAML.load_file(File.join(RootDir, 'definitions', "defaults.yaml"))
    test_definitions = File.join(RootDir, 'definitions', "#{@test_name}.yaml")
    @test_params.merge!(YAML.load_file(test_definitions)) if File.exist?(test_definitions)
    @test_params.merge!(opts)
    @test_params[:test_to_run] ||= test2run
    @test_params[:agent_port] = get_unused_agent_port(@test_params)
    ENV['AGENT_PORT'] = @test_params[:agent_port].to_s # for docker-compose.yml
    show_configuration if $VERBOSE || opts[:noop]
    if opts[:medelexis]
      glob_pattern = "*medelexis*application*.zip"
      unless (medelexis = Dir.glob(glob_pattern)) && medelexis.size > 0
        puts "Unable to find Medelexis zip file via #{glob_pattern}"
        exit 1
      end
      zip_file = File.expand_path(medelexis.first)
      puts "Unpacking Medelexs zip file #{medelexis}"
      prepare_medelexis(Dir.pwd)
      @medelexis_script = "/app/install_sw_medelexis.rb /home/elexis/work/Medelexis #{opts[:variant]} /home/elexis/results 2>&1 | tee /home/elexis/results/install_sw_medelexis.log "
      @start_jubula = '/app/start_jubula.rb localhost 8752 2>&1 | /usr/bin/tee --append /home/elexis/results/start_jubula.log &'
      FileUtils.rm_rf(WorkDir, :verbose => true, :noop => opts[:noop])
      FileUtils.makedirs(WorkDir, :verbose => true, :noop => opts[:noop])
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

