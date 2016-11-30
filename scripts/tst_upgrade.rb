#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'socket'
require 'tmpdir'
require 'etc'
require 'trollop'
require 'sequel'
require 'yaml'

# or https://github.com/yamldb/yaml_db ??
# http://www.frick-web.at/blog/import-old-database-in-new-schema-with-mysql-and-rails
# http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
# Ticket 5295

begin
  require 'pry'
rescue LoadError
end
DEFAULT_JDBC = 'jdbc:mysql:localhost/tstxx'
DEFAULT_DB_DUMP = '/opt/db_dumps/rgw_1.8.6.sql' # takes 14 seconds to load, 188 MB
# /opt/db_dumps/vecellio_anonym.sql 13 GB
# For Postgres /opt/db_dumps/postgres/db_dump_schoebu_anonym # Takes minutes to load, 2.2 GB

def dump_schema_to_migration(database: DB, outfile: File.join(INFO_TODAY, 'db.schema'))
  system("sequel --dump-migration #{database} > #{outfile}")
end

# org.osgi.framework.BundleException
# sequel mysql2://localhost/hgz
def get_db_elexis_version(database: DB)
  db  = Sequel.connect(database)
  db_version = db[:config].filter[:param => 'dbversion'][:wert]
  elexis_version = db[:config].filter[:param => 'ElexisVersion'][:wert]
  puts "db_version #{db_version} elexis_version #{elexis_version}"
  puts db.run(" select wert from config where param like 'ElexisVersion';")
  puts db.run(" select wert from config where param like 'dbVersion';")
  return [db_version, elexis_version]
end

def create_database(database: DB_NAME, root_pw: OPTS[:root_pw])
  user,pw = OPTS[:db_pw].split('/')
  # rant all on elexis_test.* to elexis@'%'
  cmds =
      [ "create database if not exists #{database}",
        "GRANT ALL ON #{database}.* TO '#{user}'@'%' IDENTIFIED BY '#{pw}'",
        ]
  cmds.each do |cmd|
    full_cmd = 'echo "' + cmd + "\"| #{DB_ROOT_CMD};"
    puts full_cmd
    unless system(full_cmd)
      fail "Unable to create database using #{cmd}"
    end
  end
end

def load_database_dump
  fail "Could not read file #{OPTS[:db_dump]}" unless File.readable? OPTS[:db_dump]
  cmd = "cat #{OPTS[:db_dump]} | #{DB_ROOT_CMD}  #{DB_NAME}"
  start_time = Time.now
  system(cmd)
  diff_seconds = (Time.now - start_time).to_i
  puts "Loading the databse #{OPTS[:db_dump]} took #{diff_seconds} seconds"
end


def start_pry
  db  = Sequel.connect(DB)
  binding.pry
end

def elexis_database_info(database: DB)
  STDOUT.write("Creating elexis_database_info."); STDOUT.sync = true

  db  = Sequel.connect(database)
  db_info = {}
  db_info[:db_label]       = File.basename(OPTS[:db_dump]).split('_').first
  db_info[:sql_dump]       = OPTS[:db_dump]
  db_info[:sql_dump_size]  = (File.size(OPTS[:db_dump])/1024/1024).to_s + ' MB' if File.exist?(OPTS[:db_dump])
  db_info[:db_type]        = 'mysql'
  db_info[:db_client]      = Mysql2::Client.info
  db_info[:db_version]     = db[:config].filter[:param => 'dbversion'][:wert]
  db_info[:elexis_version] = db[:config].filter[:param => 'ElexisVersion'][:wert]
  all_tables = {}

  new_db_elexis = File.join(INFO_ROOT, db_info[:db_label], db_info[:db_version] + '-' + db_info[:elexis_version])
  my_root = File.exist?(new_db_elexis) ? INFO_TODAY : new_db_elexis
  FileUtils.makedirs(my_root)

  # TODO: append output of the following MySQL commands
  # SHOW GLOBAL VARIABLES LIKE '%version%';
  # status

  db.tables.each do |tablename|
    STDOUT.write('.')
    this_table = {:nr_rows => db[tablename].all.size}
    if db[tablename].columns.index(:lastupdate)
      dataset = db["SELECT FROM_UNIXTIME(lastupdate/1000) as human FROM  #{tablename} where lastupdate is not null"]
      dataset.map(:human)
      msg = "#{tablename.to_s}: lastupdate: #{dataset.map(:human).min} -> #{dataset.map(:human).max }"
      this_table[:last_update] = [dataset.map(:human).min, dataset.map(:human).max]
    end
    all_tables[tablename] = this_table
  end
  db_info[:tables] = all_tables
  db_yaml = File.join(my_root, 'db.yaml')
  File.open(db_yaml, 'w') {|f| f.write db_info.to_yaml } #Store
  puts
  db_schema = File.join(my_root, 'db.schema')
  dump_schema_to_migration(database: database,  outfile: db_schema)
  sql_schema = File.join(my_root, 'db.mysql')
  cmd = "#{DB_ROOT_CMD} --no-data #{DB_NAME} > #{sql_schema}".sub('mysql', 'mysqldump')
  system(cmd)
  puts "Stored info under #{my_root}"
  if my_root.eql?(new_db_elexis)
    # add it to git
    system("git add #{sql_schema} #{db_yaml} #{db_schema}")
  end
end


OPTS = Trollop::options do
  version = "JubulaRunner 0.1 (c) by Niklaus Giger <niklaus.giger@member.fsf.org>"
  banner <<-EOS
Useage:
  * Test upgrade from an old (Med-)Elexis version to a newer one
EOS
  opt :dry_run,       "Dry-Run. Show configuration and commands without exectuing them", :default => false
  opt :elexis,        "Path to the elexis executable", :type => String, :default => './Elexis3'
  opt :jdbc,          "The jdbc parameter to connect to e.g.", :type => String, :default => DEFAULT_JDBC
  opt :db_pw,         'Username/Password for the database', :type => String, :default => 'elexis/elexisTest'
  opt :user_pw,       'Username/Password for Elexis', :type => String, :default => 'elexis/elexisTest'
  opt :root_pw,       'Password for mysql/postgres root user', :type => String, :default => 'elexisTest'
  opt :db_dump,       'The full path for the sql_dump to load', :type => String, :default => DEFAULT_DB_DUMP
  opt :variant,       "Possible values are snapshot, beta, prerelease, release", :type => String, :default => 'snapshot'
  opt :info,          "Open database and save DB-Info (inkl. elexis/db-version, nr_rows, max/min lastupdate)"
  opt :pry,           "Open a pry debug session with sequel"
end

DB_ROOT    = OPTS[:jdbc].sub('jdbc:','').sub('mysql:', 'mysql2://')
DB = OPTS[:jdbc].sub('jdbc:','').sub('mysql:', 'mysql2://' + OPTS[:user_pw].sub('/',':')+'@')
DB_NAME = DB.split('/').last
DB_ROOT_CMD = "mysql -u root --password=#{OPTS[:root_pw]}"
START_TIME = Time.now
INFO_ROOT = File.expand_path(File.join(__FILE__, '..', '..', 'db_info'))
INFO_TODAY = File.join(INFO_ROOT, DB_NAME, START_TIME.strftime('%Y%m%d.%H%M%S'))

# $ docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
# Initializing a fresh instance

# When a container is started for the first time, a new database with the specified name will be created and initialized with the
# provided configuration variables. Furthermore, it will execute files with extensions .sh, .sql and .sql.gz that are found in
# /docker-entrypoint-initdb.d. Files will be executed in alphabetical order.
# You can easily populate your mysql services by mounting a SQL dump into that directory and provide custom images with contributed data.
# SQL files will be imported by default to the database specified by the MYSQL_DATABASE variable.

if OPTS[:info]
  elexis_database_info
elsif OPTS[:pry]
  start_pry
else
  create_database
  load_database_dump
  get_db_elexis_version
end