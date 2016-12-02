#!/usr/bin/env ruby
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'socket'
require 'tmpdir'
require 'etc'
require 'trollop'

#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'socket'
require 'tmpdir'
require 'etc'
$LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)), 'lib')
require 'db_helpers'
require 'inst_helpers'
require 'jubula_options'
require 'jubula_runner'
# or https://github.com/yamldb/yaml_db ??
# http://www.frick-web.at/blog/import-old-database-in-new-schema-with-mysql-and-rails
# http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
# Ticket 5295

options = JubulaOptions.new(ARGV)
res = JubulaRunner.new.run(options)
exit(res ? 0 : 1)
