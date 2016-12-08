require 'db_helpers'
require 'inst_helpers'
require 'docker_runner'
class UpgradeRunner
  attr_reader :opts, :db_root_cmd, :db, :start_time, :info_root, :info_today
  include DbHelpers
  include InstHelpers
  def cleanup(result_dir)
    dirs = [opts[:variant]] +  Dir.glob(result_dir)
    dirs.each do |dir|
      puts "Removing directory and its content: #{dir}"
      FileUtils.rm_rf(dir, :verbose => true, :noop => opts[:noop] )
    end
  end
  def run(options)
    @opts = options
    if opts[:definition]
      name = File.expand_path("definitions/#{opts[:definition]}.yaml")
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
    opts[:result_dir] = "results_#{opts[:variant]}"
    @db  = Sequel.connect(patch_jdbc_for_sequel)
    if opts[:clean]
      drop_database unless opts[:run_in_docker]
      cleanup(opts[:result_dir])
    end
    FileUtils.makedirs(opts[:result_dir], :verbose => true, :noop => opts[:noop] ) unless File.exist?(opts[:result_dir])
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
              puts "upgrade_runner: load_elexis_db_if_not_exist"
              # fail 'simulate_error'
              res = load_elexis_db_if_not_exist
              puts "upgrade_runner: load_elexis_db_if_not_exist done. res #{res.inspect}"
              res = elexis_database_info
              puts "upgrade_runner: elexis_database_info done. res #{res.inspect}"
              res = upgrade
              puts "upgrade_runner:upgrade done. res #{res.inspect}"
              res_info = elexis_database_info
              puts "upgrade_runner: elexis_database_info done. res_info #{res_info.inspect}"
            rescue RuntimeError => e
              puts "#{Time.now}: Catched run_in_docker? #{run_in_docker?} @docker #{@docker.class} runtimeError #{e}  :stop_docker #{self.respond_to?(:stop_docker)} #{e.backtrace.join("\n")}"
              exit 78
            end
          else
            @opts[:compose_file] = "upgrader/docker-compose.yml"
            @opts[:docker_name] = "runner"
            @docker = DockerRunner.new(opts)
            DockerRunner.trap_ctrl_c(@docker, @opts)
            prepare_license(@docker.container_home) if opts[:medelexis]
            cmd  = %(cd /home/elexis
bundle install
bundle exec /home/elexis/bin/tst_upgrade.rb --clean --upgrade --run-in-docker #{opts[:definition] ? ('--definition='+opts[:definition]) : ''}
)
            cmd_name = "/home/elexis/upgrade_#{opts[:variant]}.sh"
            res = @docker.run_cmd_in_docker(cmd_name, cmd)
            @docker.stop_docker
          end
        end
      else
        create_database
        load_elexis_db_if_not_exist
        get_db_elexis_version
        prepare_license if opts[:medelexis]
        res = upgrade
        elexis_database_info
      end
    elsif opts[:clean]
      res = true
    else
      puts "No action specified"
      res = false
    end
    diff_seconds = (Time.now - start_time).to_i
    okay = true
    results = Dir.glob(opts[:result_dir] + '/**/install_sw_medelexis.errors')
    if opts[:upgrade] && !opts[:noop] && !run_in_docker?
      puts "Checking #{results}"
      regexp = /Handled (\d+) error/
      results.each do |file|
        status_line = IO.readlines(file)[0] # by convention
        unless regexp.match(status_line)
          puts "upgrade_runner fails: No line containing #{regexp} found in #{file}"
          okay = false
          break
        end
        # TODO: Should we fail because of erros like LOINC missin?
        if regexp.match(status_line)[1].to_i > 0
          puts "upgrade_runner fails: Found #{regexp.match(status_line)[1].to_i} errors in #{file} shows errors"
          okay = false
          break
        end if false
        puts "Found '#{status_line.chomp}' in #{file}. That is good. Details are in #{file.sub('errors', 'done')}"
      end
      if results.size != 2
        puts "upgrade_runner fails: Need 2 install_sw_medelexis.done in #{opts[:result_dir]}. Found only #{results.size}"
        okay = false
      end
    end
    InstHelpers.report_result(options) if opts[:upgrade]
    if run_in_docker? || opts[:noop]
      FileUtils.cp_r(opts[:db_info_root], opts[:result_dir], :verbose => true, :noop => opts[:noop]) if opts[:db_info_root]
      puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: took #{diff_seconds} seconds to run. returning #{okay.inspect}"
      return okay
    else
      puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: took #{diff_seconds} seconds to run. Exit status 0 if #{okay.inspect}"
      exit(okay ? 0 : 1)
    end
  end
end
