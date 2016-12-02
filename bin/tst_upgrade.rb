#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'socket'
require 'tmpdir'
require 'etc'
$LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)), 'lib')
require 'db_helpers'
require 'inst_helpers'
require 'upgrade_options'
require 'upgrade_runner'
# or https://github.com/yamldb/yaml_db ??
# http://www.frick-web.at/blog/import-old-database-in-new-schema-with-mysql-and-rails
# http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
# Ticket 5295

begin
  require 'pry'
rescue LoadError
end

options = UpgradeOptions.new(ARGV)
UpgradeRunner.new.run(options)

# $ docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
# Initializing a fresh instance

# When a container is started for the first time, a new database with the specified name will be created and initialized with the
# provided configuration variables. Furthermore, it will execute files with extensions .sh, .sql and .sql.gz that are found in
# /docker-entrypoint-initdb.d. Files will be executed in alphabetical order.
# You can easily populate your mysql services by mounting a SQL dump into that directory and provide custom images with contributed data.
# SQL files will be imported by default to the database specified by the MYSQL_DATABASE variable.



