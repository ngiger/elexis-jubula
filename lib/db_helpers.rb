require 'pp'
require 'sequel'
require 'yaml'

module DbHelpers
  def dump_schema_to_migration(outfile = File.join(info_today, 'db.schema'))
    system("sequel --dump-migration #{patch_jdbc_for_sequel} > #{outfile}")
  end

  LOG_START = /^\d+:\d+:\d+\.\d+\s+\[\w+\]\s+\w+\s+/
  def analyse_log(elexis_log)
    # TODO: catch errors in spec/data/no_db_connection.log
    # 17:42:47.425 [main] ERROR ch.elexis.core.application.Desk - Database connection error
    # java.lang.NullPointerException: null
    # at ch.elexis.data.DBConnection.getDBFlavor(DBConnection.java:100) ~[ch.elexis.core.data_3.1.0.r20161108-1048.jar:na]
    # 18:16:21.028 [main] ERROR ch.elexis.data.DBConnection - can't connect to test database invalid. dbFlavormysql://elexis:elexisTest@ng-tr/test_elexis
# 18:18:38.780 [main] INFO  jdbcLink - Connecting with database jdbc:mysql://elexis:elexisTest@ng-tr/test_elexis
# 18:18:38.809 [main] ERROR ch.elexis.data.PersistentObject - Exception connecting to test database:jdbc:mysql://elexis:elexisTest@ng-tr/test_elexis using mysql: Connect failed: SQL exception: Cannot load connection class because of underlying exception: 'java.lang.NumberFormatException: For input string: elexisTest@ng-tr'. (SQL

    info = {}
    IO.readlines(elexis_log).each do |line|
      info[:db_update_started] = line.sub(LOG_START, '') if /Start DBUpdate from Version/i.match(line)
      info[:finished] = line if /Executed SELECT ID FROM KONTAKT WHERE istPatient='1' AND deleted='0'/i.match(line)
    end
    pp info
    info
  end

  # eg. jdbc:postgresql://ng-tr/sbu3
  #  jdbc:mysql:[USER/PASSWORD]@[HOST][:PORT]:SID
  # mysql2://elexis:elexisTest@localhost/vece
  # TODO: Support db_host
  def jdbc_to_hash(jdbc)
    info = {}
    info[:db_type] = jdbc.split(':').first.sub('mysql2', 'mysql')
    info[:db_name] = jdbc.split('/').last.split('/').last
    info[:db_user] = /\/(\w+)[:@\/]/.match(jdbc)[1]
    if m = /[\/@]([\w-]+)[\/]/.match(jdbc)
      info[:db_host] = m[1]
    else
      info[:db_host] ='localhost'
    end
    info[:db_password] = /[:](\w+)[@\/]/.match(jdbc)[1]
    info[:db_elexis_params] = "-Dch.elexis.username=#{opts[:elexis_user]} -Dch.elexis.password=#{opts[:elexis_password]} " +
        " -Dch.elexis.dbUser=#{info[:db_user]} -Dch.elexis.dbPw=#{info[:db_password]}  -Dch.elexis.dbFlavor=#{info[:db_type]}" +
        " -Dch.elexis.dbSpec=jdbc:#{info[:db_type]}://#{info[:db_host]}/#{info[:db_name]}"
    info
  end

  def patch_jdbc_for_sequel
    opts[:jdbc].sub('mysql:', 'mysql2:')
  end

  # org.osgi.framework.BundleException
  # sequel mysql2://localhost/hgz
  def get_db_elexis_version
    db  = Sequel.connect(patch_jdbc_for_sequel)
    return ['0.0', 'x.y'] if opts[:noop]
    db_version = db[:config].filter[:param => 'dbversion'][:wert]
    elexis_version = db[:config].filter[:param => 'ElexisVersion'][:wert]
    puts "db_version #{db_version} elexis_version #{elexis_version}"
    puts db.run(" select wert from config where param like 'ElexisVersion';")
    puts db.run(" select wert from config where param like 'dbVersion';")
    return [db_version, elexis_version]
  end

  def create_database
    return true if run_in_docker?
    cmds =
        [ "create database if not exists #{opts[:db_name]}",
          "GRANT ALL ON #{opts[:db_name]}.* TO '#{opts[:db_user]}'@'%' IDENTIFIED BY '#{opts[:db_password]}'",
          ]
    cmds.each do |cmd|
      full_cmd = 'echo "' + cmd + "\"| #{db_root_cmd};"
      unless system(full_cmd)
        fail "Unable to create database #{opts[:db_name]} using #{cmd}"
      end
    end
  end
  def drop_database
    cmd = "drop database #{opts[:db_name]}"
    full_cmd = "#{db_root_cmd}  --execute '#{cmd}'"
    unless system(full_cmd)
      puts "Unable to drop database #{opts[:db_name]} using #{cmd}"
    else
      puts "Successfully dropped database #{opts[:db_name]}"
    end
  end

  def load_database_dump
    fail "Could not read file #{opts[:db_dump]}" unless File.readable? opts[:db_dump]
    # Delete from the database dump the create database and use command
    cmd = "cat #{opts[:db_dump]} | egrep -v  '^CREATE DATABASE|^USE '| #{db_root_cmd}  #{opts[:db_name]}"
    puts "Loading database #{opts[:db_name]} from #{opts[:db_dump]} (#{size_in_mb(opts[:db_dump])}). This could take a long time"
    start_time = Time.now
    system(cmd)
    diff_seconds = (Time.now - start_time).to_i
    puts "Loading the database #{opts[:db_dump]} took #{diff_seconds} seconds"
  end


  def start_pry
    db  = Sequel.connect(patch_jdbc_for_sequel)
    puts db
    binding.pry # in start_pry
  end

  def size_in_mb(filename)
    (File.size(filename)/1024/1024).to_s + ' MB'
  end

  def load_elexis_db_if_not_exist
    db  = Sequel.connect(patch_jdbc_for_sequel)
    has_tables = false
    begin
      has_tables = db.tables # Maybe the database does not
    rescue Sequel::DatabaseConnectionError
    end
    puts "load_elexis_db_if_not_exist has_tables is #{has_tables.inspect} noop #{ opts[:noop]}"
    unless has_tables && has_tables.size > 0
      create_database unless opts[:noop]
      load_database_dump
    end
  end

  def elexis_database_info
    STDOUT.write("Creating elexis_database_info."); STDOUT.sync = true
    load_elexis_db_if_not_exist
    db_info = {}
    db_info[:db_label]       = File.basename(opts[:db_dump]).split('_').first
    db_info[:sql_dump]       = opts[:db_dump]
    db_info[:sql_dump_size]  = size_in_mb(opts[:db_dump]) if File.exist?(opts[:db_dump])
    db_info[:db_type]        = 'mysql'
    db_info[:db_client]      = Mysql2::Client.info
    unless opts[:noop]
      db_info[:db_version]     = db[:config].filter[:param => 'dbversion'][:wert]
      db_info[:elexis_version] = db[:config].filter[:param => 'ElexisVersion'][:wert]
    end
    all_tables = {}

    if opts[:noop]
      puts "noop: Would save various database info for: #{db_info[:db_type]} #{db_info[:db_label]}"
      return
    end
    new_db_elexis = File.join(info_root, db_info[:db_label], db_info[:db_version] + '-' + db_info[:elexis_version])
    my_root = File.exist?(new_db_elexis) ? info_today : new_db_elexis
    FileUtils.makedirs(my_root, :noop => opts[:noop])
    # TODO: append output of the following MySQL commands
    # SHOW GLOBAL VARIABLES LIKE '%version%';
    # status

    db.tables.each do |tablename|
      STDOUT.write('.')
      this_table = {:nr_rows => db[tablename].all.size}
      if db[tablename].columns.index(:lastupdate)
        dataset = db["SELECT FROM_UNIXTIME(lastupdate/1000) as human FROM  #{tablename} where lastupdate is not null"]
        dataset.map(:human)
        this_table[:last_update] = [dataset.map(:human).min, dataset.map(:human).max]
      end
      all_tables[tablename] = this_table
    end
    db_info[:tables] = all_tables
    db_yaml = File.join(my_root, 'db.yaml')
    File.open(db_yaml, 'w') {|f| f.write db_info.to_yaml } #Store
    puts
    db_schema = File.join(my_root, 'db.schema')
    dump_schema_to_migration(db_schema)
    sql_schema = File.join(my_root, 'db.mysql')
    cmd = "#{db_root_cmd} --user #{opts[:db_user]} --password=#{opts[:db_password]} --no-data #{opts[:db_name]} > #{sql_schema}".sub('mysql', 'mysqldump')
    fail "Unable to to dump schema using #{cmd}" unless system(cmd)
    puts "Stored info under #{my_root}"
    if my_root.eql?(new_db_elexis)
      # add it to git
      system("git add #{sql_schema} #{db_yaml} #{db_schema}")
    else
      true
    end
  end

end