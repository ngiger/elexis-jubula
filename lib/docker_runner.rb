require 'common'

# Helper class to use docker for the Jubula AUT
class DockerRunner
  attr_reader :container_home, :start_with, :noop
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

  def start_docker(cmd_in_docker, env = nil, workdir = nil)
    puts "cmd_in_docker #{cmd_in_docker} with uid #{ENV['HOST_UID']}"
    [ # instead of calling build, create, start we can use compose up -d
      # Only possibility to make it work under compose 1.8
      @start_with + 'up -d', # create and start do not create a network with compose 1.8, up -d does
      # TODO: How to run several instances of jenkinstest in parallel
      # using docker-compose scale and exec --index
      # added -T to work around bug https://github.com/docker/compose/pull/4059
      @start_with + "exec -T --user elexis #{@docker_name} #{cmd_in_docker}",
    ].each do |cmd|
      sleep(2, @noop); puts "start_docker #{cmd}"
      next if @noop
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
    return true if @noop
    system(cmd, MAY_FAIL)
    @stop_commands.each do |cmd| res = system(cmd, MAY_FAIL) end
    $need_to_stop_docker = false
  end

  def initialize(test_name, result_dir, agent_port, noop = false)
    @noop = noop
    @test_name = test_name
    @result_dir = result_dir
    # TODO: Fix running tests in parallel
    @docker_name = "jenkinstest" # this did work when calling docker directly "jubula-#{@test_name}-#{ENV['VARIANT']}"
    @container_home = File.join(RootDir, 'container_home')
    @m2_repo = File.join(RootDir, 'container_home_m2')
    FileUtils.makedirs(@m2_repo, :verbose => true, :noop => noop)
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
    return true if @noop
    @stop_commands.each do |cmd| res = system(cmd, MAY_FAIL) end
  end
end

