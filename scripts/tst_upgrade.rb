#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'socket'
require 'tmpdir'
require 'etc'
require 'trollop'
require 'sequel'
require 'yaml'
$LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)), 'lib')
require 'db_helpers'
require 'inst_helpers'
# or https://github.com/yamldb/yaml_db ??
# http://www.frick-web.at/blog/import-old-database-in-new-schema-with-mysql-and-rails
# http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
# Ticket 5295

begin
  require 'pry'
rescue LoadError
end
DEFAULT_JDBC = 'mysql://elexis:elexisTest@localhost/test_elexis'
DEFAULT_DB_DUMP = '/opt/db_dumps/rgw_1.8.6.sql' # takes 14 seconds to load, 188 MB
# /opt/db_dumps/vecellio_anonym.sql 13 GB
# For Postgres /opt/db_dumps/postgres/db_dump_schoebu_anonym # Takes minutes to load, 2.2 GB
CACHE_BASE = '/opt/downloads' # will be populated with downloads from download.elexis.info or medelexis

OPTS = Trollop::options do
  version = "JubulaRunner 0.1 (c) by Niklaus Giger <niklaus.giger@member.fsf.org>"
  banner <<-EOS
Useage:
  * Test upgrade from an old (Med-)Elexis version to a newer one
EOS
  opt :clean,         "Drops the database, the results and install directories", :default => false
  opt :definition,    "If given, the value from the definition/<definition>.yaml will override the defaults", :type => String, :default => nil
  opt :drop,          "Drop the database"
  opt :dry_run,       "Dry-Run. Show configuration and commands without executing them", :default => false
  opt :medelexis,     "Use the medelexis variant", :default => true
  opt :jdbc,          "The jdbc parameter to connect to e.g.", :type => String, :default => DEFAULT_JDBC
  opt :elexis_user,    'Username for Elexis', :type => String, :default => 'elexis'
  opt :elexis_password, 'Username for Elexis', :type => String, :default => 'elexisTest'
  opt :root_pw,       'Password for mysql/postgres root user', :type => String, :default => 'elexisTest'
  opt :db_dump,       'The full path for the sql_dump to load', :type => String, :default => DEFAULT_DB_DUMP
  opt :variant,       "Possible values are snapshot, beta, prerelease, release", :type => String, :default => 'prerelease'
  opt :info,          "Open (load if not yet exist) database and save DB-Info (inkl. elexis/db-version, nr_rows, max/min lastupdate)"
  opt :pry,           "Open a pry debug session with sequel"
  opt :upgrade,       "Download (cached in #{CACHE_BASE}) (Med-)Elexis,
  start it twice and
  visit all views to catch possible errors, NPE, etc"
  opt :license_file,  'License file to use for Medelexis', :type => String, :default => nil
end


if OPTS[:definition]
  name = "definitions/#{OPTS[:definition]}.yaml"
  fail "Could not find definition file #{name}" unless File.exist?(name)
  OPTS.merge! YAML.load_file(name)
end
OPTS.merge! DbHelpers.jdbc_to_hash(OPTS[:jdbc])
DB_ROOT_CMD = "mysql  --host #{OPTS[:db_host]} -u root --password=#{OPTS[:root_pw]}"
puts "DB_ROOT_CMD is #{DB_ROOT_CMD}"
START_TIME = Time.now
INFO_ROOT = File.expand_path(File.join(__FILE__, '..', '..', 'db_info'))
INFO_TODAY = File.join(INFO_ROOT, OPTS[:db_name], START_TIME.strftime('%Y%m%d.%H%M%S'))

# $ docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
# Initializing a fresh instance

# When a container is started for the first time, a new database with the specified name will be created and initialized with the
# provided configuration variables. Furthermore, it will execute files with extensions .sh, .sql and .sql.gz that are found in
# /docker-entrypoint-initdb.d. Files will be executed in alphabetical order.
# You can easily populate your mysql services by mounting a SQL dump into that directory and provide custom images with contributed data.
# SQL files will be imported by default to the database specified by the MYSQL_DATABASE variable.

if OPTS[:clean]
  DbHelpers.drop_database
  dirs = [OPTS[:variant]] +  Dir.glob("results-#{OPTS[:variant]}-*")
  dirs.each do |dir|
    puts "Removing directory and its content: #{dir}"
    FileUtils.rm_rf(dir, :noop => OPTS[:dry_run] )
  end
end

if OPTS[:info]
  DbHelpers.elexis_database_info
elsif OPTS[:drop]
  DbHelpers.drop_database
elsif OPTS[:upgrade]
  DbHelpers.load_elexis_db_if_not_exist
  InstHelpers.upgrade
elsif OPTS[:pry]
  DbHelpers.start_pry
else
  DbHelpers.create_database
  DbHelpers.load_database_dump
  DbHelpers.get_db_elexis_version
end