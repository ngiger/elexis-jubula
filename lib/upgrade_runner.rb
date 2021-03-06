require 'db_helpers'
require 'inst_helpers'
require 'docker_runner'
begin
  require 'pg'
  require 'mysql'
rescue LoadError
  require 'mysql2'
end

class UpgradeRunner
  attr_reader :opts, :db_root_cmd, :db, :start_time, :info_root, :info_today
  include DbHelpers
  include InstHelpers
  def cleanup(result_dir)
    dirs = [ WorkDir, @opts[:variant],'vendor/indocker'] +  Dir.glob(result_dir)
    dirs.each do |dir|
      puts "Removing directory and its content: #{dir}"
      FileUtils.rm_rf(dir, :verbose => true, :noop => @opts[:noop] )
    end
    unless File.exist?(WorkDir)
      FileUtils.makedirs(WorkDir)
      File.open("#{WorkDir}/creation.#{Time.now.strftime('%H.%M.%S')}", 'w+') { |f| f.puts "Created by #{__FILE__}: opts #{@opts}" }
    end
  end
  def run(options)
    @opts = options
    jdbc_to_hash(@opts)
    start_time = Time.now
    @info_root = File.expand_path(File.join(__FILE__, '..', '..', 'db_info'))
    @info_today = File.join(@info_root, @opts[:db_name], start_time.strftime('%Y%m%d.%H%M%S'))
    @opts[:result_dir] = "results_#{@opts[:variant]}_#{@opts[:definition]}"
    @db  = Sequel.connect(@opts[:sequel_connect])
    if @opts[:medelexis]
      raise "Remove #{WorkDir} with installed Elexis-Opensource" if Dir.glob(File.join(WorkDir, 'Elexis3*')).size > 0
    else
      raise "We don't have adapted this script for the Elexis OpenSource. Patches welcome"
    end
    if @opts[:definition]
      name = File.expand_path("definitions/#{@opts[:definition]}.yaml")
      fail "Could not find definition file #{name}" unless File.exist?(name)
      @opts.merge! YAML.load_file(name)
      jdbc_to_hash(@opts)
    end
    if @opts[:clean]
      drop_database unless @opts[:run_in_docker]
      cleanup(@opts[:result_dir])
    end
    FileUtils.makedirs(@opts[:result_dir], :verbose => true, :noop => @opts[:noop] ) unless File.exist?(@opts[:result_dir])
    res = false
    if @opts[:info]
      load_elexis_db_if_not_exist
      res = elexis_database_info
    elsif @opts[:drop]
      res = drop_database
    elsif @opts[:upgrade]
      if @opts[:run_in_docker]
        begin
          if run_in_docker?
            run_installation
          else
            @opts[:compose_file] = "upgrader/docker-compose.yml"
            @opts[:docker_name] = "runner"
            @docker = DockerRunner.new(@opts) if @opts[:run_in_docker]
            prepare_license(@docker.container_home)
            DockerRunner.trap_ctrl_c(@docker, @opts)
            cmd  = %(cd /home/elexis
# here we decided to use the apt-package for trollop sequel mysql2 and pg instead of calling
# bundle install --path=vendor/indocker --without debugger
# bundle exec /home/elexis/
bin/tst_upgrade.rb --clean --upgrade )
            [ :definition, :variant, :dummy].each do |param|
              next unless @opts[param]
              cmd += " --#{param}=#{@opts[param]}"
            end
            cmd += ' --medelexis' if @opts[:medelexis]
            cmd_name = "/home/elexis/upgrade_#{@opts[:variant]}.sh"
            res = @docker.run_cmd_in_docker(cmd_name, cmd)
            @docker.stop_docker
          end
        end
      else # run directly
        prepare_license
        create_database
        run_installation
        elexis_database_info
      end
    elsif @opts[:clean]
      res = true
    else
      puts "No action specified"
      res = false
    end
    diff_seconds = (Time.now - start_time).to_i
    result_okay = show_results
    if run_in_docker? || @opts[:noop]
      FileUtils.cp_r(@opts[:db_info_root], @opts[:result_dir], :verbose => true, :noop => @opts[:noop]) if @opts[:db_info_root]
      puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: took #{diff_seconds} seconds to run. returning #{result_okay.inspect}"
      return result_okay
    else
      puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: Total time #{diff_seconds}:#{sprintf('%02d',diff_seconds)}. Result #{result_okay ? 'SUCCESS' : opts[:noop] ? 'opts[:noop]' : 'FAILURE'}"
      exit(result_okay ? 0 : 1) unless defined?(RSpec)
    end
  end
  private

  def show_results
    okay = true
    elexis_log = (opts[:run_in_docker] ? "#{@docker.container_home}/elexis" : Dir.home) + "/logs/elexis-3.log"
    FileUtils.cp(elexis_log, @opts[:result_dir], :verbose => true) unless run_in_docker?
    results = Dir.glob(@opts[:result_dir] + '/**/install_sw_medelexis.errors')
    if @opts[:upgrade] && !@opts[:noop] && !run_in_docker?
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
      needed_done = 3
      if results.size != needed_done
        puts "upgrade_runner fails: Need #{needed_done} install_sw_medelexis.done in #{@opts[:result_dir]}. Found #{results.size}"
        okay = false
      end
    end
    InstHelpers.report_result(@opts) if @opts[:upgrade]
    okay
  end

  def run_installation
    res = true
    puts "upgrade_runner: load_elexis_db_if_not_exist"
    res = load_elexis_db_if_not_exist
    puts "upgrade_runner: load_elexis_db_if_not_exist done. res #{res.inspect}"
    res = elexis_database_info
    puts "upgrade_runner: elexis_database_info done. res #{res.inspect}"
    res = upgrade
    puts "upgrade_runner:upgrade done. res #{res.inspect}"
    res_info = elexis_database_info
    puts "upgrade_runner: elexis_database_info done. res_info #{res_info.inspect}"
  end
end
