require 'db_helpers'
require 'inst_helpers'
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
  def run(options)
    @opts = options
    if opts[:definition]
      name = "definitions/#{opts[:definition]}.yaml"
      fail "Could not find definition file #{name}" unless File.exist?(name)
      opts.merge! YAML.load_file(name)
    end
    opts.merge! jdbc_to_hash(opts[:jdbc])
    @db_root_cmd = "mysql  --host #{opts[:db_host]} -u root --password=#{opts[:root_pw]}"
    puts "db_root_cmd is #{@db_root_cmd}"
    start_time = Time.now
    @info_root = File.expand_path(File.join(__FILE__, '..', '..', 'db_info'))
    @info_today = File.join(@info_root, opts[:db_name], start_time.strftime('%Y%m%d.%H%M%S'))
    @db  = Sequel.connect(patch_jdbc_for_sequel)
    if opts[:clean]
      drop_database
      dirs = [opts[:variant]] +  Dir.glob("results-#{opts[:variant]}-*")
      dirs.each do |dir|
        puts "Removing directory and its content: #{dir}"
        FileUtils.rm_rf(dir, :verbose => true, :noop => opts[:noop] )
      end
    end
    res = if opts[:info]
      load_elexis_db_if_not_exist
      elexis_database_info
    elsif opts[:drop]
      drop_database
    elsif opts[:upgrade]
      load_elexis_db_if_not_exist
      elexis_database_info if upgrade
    elsif opts[:pry]
      start_pry
    elsif opts[:upgrade]
      create_database
      load_database_dump
      get_db_elexis_version
    elsif opts[:clean]
      true
    else
      puts "No action specified"
      false
    end
    diff_seconds = (Time.now - start_time).to_i
    puts "#{Time.now.strftime('%Y.%m.%d %H:%M:%S')}: took #{diff_seconds} seconds to run. Exit status 0 if #{res.inspect}"
    exit(res ? 0 : 1)
  end
end
