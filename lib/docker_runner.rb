require 'common'

def run_in_docker?
  return File.exist?('/.dockerenv')
end

# Helper class to use docker for the Jubula AUT
class DockerRunner
  attr_reader :container_home, :start_with, :noop, :opts, :display
  MAY_FAIL = { :may_fail => true}
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

  def self.trap_ctrl_c(docker, opts)
    needed = opts[:need_to_stop_docker]
    trap("SIGINT") do
      puts "\n\n----- ctrl_c catched -----\n\n"
#       sleep(1, :noop => opts[:noop])
      opts[:need_to_stop_docker] = needed
      docker.stop_docker if docker && needed
      puts "ctrl_c catcher finished. Will exit(3)"
      exit(3)
    end
  end

  # TODO: Shouldn't we pass test_name, etc via the options
  def initialize(options, test_name = nil, result_dir=nil)
    @opts = options
    @noop = options[:noop]
    @test_name = test_name
    @project_name ||= 'xtest'
    @display ||= ENV['DISPLAY']
    ENV['HOST_UID'] = Process.uid.to_s
    ENV['JUBULA_RUNNER_VERSION'] = ElexisJubula::VERSION
    fail "Must pass result_dir in options" unless opts[:result_dir]
    # TODO: Fix running tests in parallel
    @container_home = @opts[:container_home] ? @opts[:container_home] : RootDir
    @m2_repo = File.join(RootDir, 'container_home_m2')
    FileUtils.makedirs(@m2_repo, :verbose => true, :noop => noop)
    @start_with = "docker-compose "
    @start_with += "-f #{@opts[:compose_file]} " if @opts[:compose_file]
    @start_with += "--project-name #{@opts[:compose_project]} " if @opts[:compose_project]
    if @test_name.eql?('build_docker')
      @cleanup_networks = []
      @stop_commands = []
    else
      @cleanup_networks =  "docker network rm  #{@project_name}_public 2>/dev/null; sleep 1; docker network rm  #{@project_name}_private 2>/dev/null"
      @stop_commands = ["#{@start_with} stop", "#{@start_with} rm --force --all", @cleanup_networks]
    end
    return true if @noop
    @stop_commands.each do |cmd| system(cmd, MAY_FAIL) end
    prepare_docker
    adapt_compose_for_x11
    check_compose_for_x11
  end

  def run_cmd_in_docker(cmd_name, cmd)
    puts cmd.gsub("\n", "\nin_docker: ") if opts[:noop]
    system('xhost local:root', :noop => opts[:noop]) if opts[:use_x11]
    script = create_docker_script(cmd_name, cmd)
    store_cmd(cmd_name, script)
    puts "cmd_in_docker #{cmd_name} with uid #{ENV['HOST_UID']}"
    [ # instead of calling build, create, start we can use compose up -d
      # @start_with + 'build',
      # Only possibility to make it work under compose 1.8
      @start_with + 'up -d', # create and start do not create a network with compose 1.8, up -d does
      # added -T to work around bug https://github.com/docker/compose/pull/4059
      @start_with + "exec -T --user elexis #{@opts[:docker_name]} #{cmd_name}",
    ].each do |a_cmd|
      sleep(2); puts "start_docker #{a_cmd}"
      next if @noop
      if @test_name.eql?('build_docker')
        res = system(a_cmd, MAY_FAIL) if /build/i.match(a_cmd)
      else
        res = system(a_cmd, MAY_FAIL)
      end
    end
    rescue RuntimeError => e
      puts "start_docker: #{cmd_name} Catched run_in_docker? #{run_in_docker?} @docker #{@docker.class} runtimeError #{e}  :stop_docker #{self.respond_to?(:stop_docker)} #{e.backtrace.join("\n")}"
      stop_docker
      exit 66
  end

  def stop_docker
    puts "@stop_commands #{@stop_commands.inspect}" if noop
    return unless opts[:need_to_stop_docker]
    cmd =  @start_with + "logs --no-color --timestamps > #{opts[:result_dir]}/containers.log"
    puts "Saving container logs using #{cmd}"
    system(cmd, MAY_FAIL.merge({ :noop => @noop}))
    @stop_commands.each do |a_cmd| system(a_cmd, MAY_FAIL.merge({ :noop => @noop})) end
    opts[:need_to_stop_docker] = false
  end

  private

  def check_compose_for_x11
    checks = [ '/tmp/.X11-unix', '/dev/snd' ]
    if opts[:use_x11] # needs also changes in docker-compose.yml!
      # Thanks to jess Fraznelle https://blog.jessfraz.com/post/docker-containers-on-the-desktop/
      @display = ENV['DISPLAY']
      checks.each do |needed_for_x|
        cmd = "#{start_with} config | /bin/grep #{needed_for_x}"
        unless system(cmd,  { :may_fail => true })
          puts "\n\n-----------\n\n"
          puts "If you want to make USE_X11 work correctly, you must add definitions"
          puts "for #{checks} into docker-compose.yaml"
          puts "\n\n-----------\n\n"
          binding.pry # Troubleshoot why USE_X11 is not working properly
          return 4
        end
      end
      puts "Activating USE_X11 for DISPLAY #{@display}"
    else
      checks.each do |needed_for_x|
        cmd = "#{start_with} config | /bin/grep #{needed_for_x}"

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
    compose_yaml = opts[:compose_file]
    inhalt = IO.readlines(compose_yaml)
    if opts[:use_x11] # needs also changes in docker-compose.yml!
      inhalt.each{|line|line.sub!(/^(\s+)# (.+)(#.+USE_X11\n)/, '\1\2\3')}.compact
      File.open(compose_yaml, 'w+'){|f| f.write(inhalt.join("")) }
      system('git diff -w wheezy', :noop => opts[:noop])
      @display = ENV['DISPLAY']
      puts "Activating USE_X11 for DISPLAY #{@display}"
    else
      puts "rollback"
      inhalt.each{|line| line.sub!(/^(\s+)([^#].*USE_X11\n)/,'\1# \2') unless /\s+#.+(#.+USE_X11\n)/.match(line)}
      File.open(compose_yaml, 'w+'){|f| f.write(inhalt.join("")) }
      system('git diff -w wheezy', { :noop => opts[:noop]})
      @display = ':1.5' # as defined below for Xvfb
    end
  end

  def prepare_docker
    stop_docker # cleanup from previous runs if any
    opts[:need_to_stop_docker] = true
    at_exit do stop_docker end
    tmp_dest_dir = File.join(RootDir, 'tmp.to_be_deleted')
    puts "tmp_dest_dir is #{tmp_dest_dir}"
    FileUtils.makedirs(tmp_dest_dir, :noop => opts[:noop])
    return unless opts[:container_home]
    if File.exists?(container_home) && !opts[:noop]
      FileUtils.mv(container_home, "#{tmp_dest_dir}/#{Time.now.strftime('%Y%m%d%H%M%s')}", verbose: true)
      fail "Must be possible to remove container_home #{container_home}" if File.exist?(container_home)
      FileUtils.rm_rf(tmp_dest_dir)
    end
    FileUtils.makedirs(container_home, :noop => opts[:noop])
    [ 'pom.xml', 'jubula-target', 'jubula-tests', 'org.eclipse.jubula.product.autagent.start'].each do |item|
      FileUtils.cp_r(File.join(RootDir, item), container_home, verbose: true, noop: opts[:noop], preserve: true)
    end
    FileUtils.cp_r(WorkDir, File.join(container_home, 'work'), verbose: true, noop: opts[:noop], preserve: true)
  end

  def store_cmd(name, cmd)
    path = File.join(opts[:run_in_docker] ? @container_home : RootDir, File.basename(name))
    puts "store_cmd #{path}"
    return if opts[:noop] && !File.directory?(File.dirname(path))
    FileUtils.makedirs(File.dirname(path), :noop => opts[:noop])
    File.open(path, 'w') do |f|
      f.puts '#!/bin/bash -v'
      f.puts(cmd)
    end
    FileUtils.chmod(0755, path, verbose: true)
    unless File.dirname(path).eql?(RootDir)
      FileUtils.cp(path, RootDir, :preserve => true, :verbose => true, :noop => opts[:noop])
    end
  end

  def prepare_for_cmd
    cmd = %(export LANG=de_CH.UTF-8
export LANGUAGE=de_CH
export DISPLAY=#{@display}
export VARIANT=#{opts[:variant]}
Xvfb :1 -screen 5 1600x1280x24 -nolisten tcp >/dev/null &
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
/usr/bin/metacity --replace --sm-disable >/dev/null &
sleep 1
/usr/bin/metacity-message disable-keybindings >/dev/null
)
    cmd += %(/usr/bin/xclock -digital -twentyfour & # Gives early feedback, that X is running
echo 'Waiting for mysql'
/home/elexis/wheezy/assets/wait-for-it.sh --timeout=30 postgres:5432 -- echo "postgres database server is up"
/home/elexis/wheezy/assets/wait-for-it.sh --timeout=90 mysql:3306 -- echo "mysql database server is up"
) unless opts[:use_x11]
    cmd
  end
  def create_docker_script(cmd_name, cmd)
    cmd = %(#{prepare_for_cmd}
#{cmd}
export status=$?
date
# find $PWD -name surefire-reports | xargs ls -lrt # needed sometimes for debugging
ps -ef
echo $status | tee #{opts[:result_dir]}/result_of_test_run
echo Resultat von #{cmd_name} um `date` war $status | tee --append #{opts[:result_dir]}/result_of_test_run
cat #{opts[:result_dir]}/result_of_test_run
ls -l #{opts[:result_dir]}/result_of_test_run
# sleep 3600 # some time for debugging uncomment this line if needed
sync # ensure that everything is written to the disk
sleep 1
echo killing children process
pkill -P $$
echo about to exit with status $status
exit $status
)
  end

end

