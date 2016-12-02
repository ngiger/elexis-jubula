require 'db_helpers'
require 'inst_helpers'
require 'docker_runner'
class UpgradeRunner
  attr_reader :opts, :db_root_cmd, :db, :start_time, :info_root, :info_today
  include DbHelpers
  include InstHelpers
  def system(cmd)
    if  opts[:noop]
      puts cmd
      return true
    end
    return Kernel.system(cmd)
  end

  def cleanup_result_dirs
    dirs = [opts[:variant]] +  Dir.glob("results-#{opts[:variant]}-*")
    dirs.each do |dir|
      puts "Removing directory and its content: #{dir}"
      FileUtils.rm_rf(dir, :verbose => true, :noop => opts[:noop] )
    end
  end
  def run(options)
    @opts = options
    if opts[:definition]
      name = "definitions/#{opts[:definition]}.yaml"
      fail "Could not find definition file #{name}" unless File.exist?(name)
      opts.merge! YAML.load_file(name)
    end
    opts[:jdbc]= 'mysql://elexis:elexisTest@mysql/elexis' if run_in_docker?
    opts.merge! jdbc_to_hash(opts[:jdbc])
    if run_in_docker?
      @db_root_cmd = "mysql  --host #{opts[:db_host]} -u elexis --password=elexisTest"
    else
      @db_root_cmd = "mysql  --host #{opts[:db_host]} -u root --password=#{opts[:root_pw]}"
    end
    puts "db_root_cmd is #{@db_root_cmd}"
    start_time = Time.now
    @info_root = File.expand_path(File.join(__FILE__, '..', '..', 'db_info'))
    @info_today = File.join(@info_root, opts[:db_name], start_time.strftime('%Y%m%d.%H%M%S'))
    @db  = Sequel.connect(patch_jdbc_for_sequel)
    if opts[:clean]
      drop_database unless opts[:run_in_docker]
      cleanup_result_dirs
    end
    res = false
    if opts[:info]
      load_elexis_db_if_not_exist
      res = elexis_database_info
    elsif opts[:drop]
      res = drop_database
    elsif opts[:upgrade]
      if opts[:run_in_docker]
        begin
          if run_in_docker?
            begin
              puts "Call load_elexis_db_if_not_exist"
              fail 'simulate_error'
              res = load_elexis_db_if_not_exist
              puts "load_elexis_db_if_not_exist done. res #{res.inspect}"
              res = elexis_database_info
              puts "elexis_database_info done. res #{res.inspect}"
              res = upgrade
              puts "upgrade done. res #{res.inspect}"
    #           res_info = elexis_database_info
              puts "elexis_database_info done. res_info #{res_info.inspect}"
            rescue RuntimeError => e
              puts "#{Time.now}: Catched run_in_docker? #{run_in_docker?} @docker #{@docker.class} runtimeError #{e}  :stop_docker #{self.respond_to?(:stop_docker)} #{e.backtrace.join("\n")}"
              exit 78
            end
          else
            @opts[:compose_file] = "upgrader/docker-compose.yml"
            @opts[:docker_name] = "runner"
            @docker = DockerRunner.new(opts)
            DockerRunner.trap_ctrl_c(@docker, @opts)
            @docker.adapt_compose_for_x11
            @docker.check_compose_for_x11
            start_env = @docker.create_env_for_script
            cmd  = %(status=98
. #{start_env}
cd /home/elexis
bundle install
bundle exec /home/elexis/bin/tst_upgrade.rb --clean --upgrade --run-in-docker
export status=$?
echo "bundle returned $status"
ps -ef
echo killing children process
pkill -P $$
echo about to exit with status $status
exit $status
)
            cmd_name = '/home/elexis/call_upgrade.sh'
            @docker.store_cmd(cmd_name, cmd)
            @docker.start_docker(cmd_name)
            @docker.stop_docker
          end
        end
      else
        create_database
        load_elexis_db_if_not_exist
        get_db_elexis_version
        res = upgrade
        elexis_database_info
      end
    elsif opts[:pry]
      start_pry
    elsif opts[:clean]
      res = true
    else
      puts "No action specified"
      res = false
    end
    diff_seconds = (Time.now - start_time).to_i
    puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: took #{diff_seconds} seconds to run. Exit status 0 if #{res.inspect}. (inside Docker #{run_in_docker?})"
    exit(res ? 0 : 1)
  end
end
