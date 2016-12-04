#!/usr/bin/env ruby
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'jubula_options'
require 'jubula_runner'
# or https://github.com/yamldb/yaml_db ??
# http://www.frick-web.at/blog/import-old-database-in-new-schema-with-mysql-and-rails
# http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
# Ticket 5295

begin
  require 'pry'
rescue LoadError
end

options = JubulaOptions.new(ARGV)
res = JubulaRunner.new.run(options)
exit(res ? 0 : 1)
