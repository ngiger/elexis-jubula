require 'trollop'

class UpgradeOptions < Hash
  DEFAULT_JDBC = 'mysql://elexis:elexisTest@localhost/test_elexis'
  DEFAULT_DB_DUMP = '/opt/db_dumps/rgw_1.8.6.sql' # takes 14 seconds to load, 188 MB
  # /opt/db_dumps/vecellio_anonym.sql 13 GB
  # For Postgres /opt/db_dumps/postgres/db_dump_schoebu_anonym # Takes minutes to load, 2.2 GB
  CACHE_BASE = '/opt/downloads' # will be populated with downloads from download.elexis.info or medelexis
  def initialize(options = ARGV)
    p = Trollop::Parser.new do
      version "JubulaRunner #{ElexisJubula::VERSION} (c) by Niklaus Giger <niklaus.giger@member.fsf.org>"
      banner <<-EOS
      #{version}
    Useage:
      * Test upgrade from an old (Med-)Elexis version to a newer one
    EOS
      opt :clean,         "Drops the database, the results and install directories", :default => false
      opt :definition,    "If given, the value from the definition/<definition>.yaml will override the defaults", :type => String, :default => nil
      opt :drop,          "Drop the database"
      opt :noop,          "No-Operation. Show configuration and commands without executing them", :default => false
      opt :medelexis,     "Use the medelexis variant", :default => true
      opt :jdbc,          "The jdbc parameter to connect to e.g.", :type => String, :default => DEFAULT_JDBC
      opt :elexis_user,    'Username for Elexis', :type => String, :default => 'elexis'
      opt :elexis_password, 'Username for Elexis', :type => String, :default => 'elexisTest'
      opt :root_pw,       'Password for mysql/postgres root user', :type => String, :default => 'elexisTest'
      opt :db_dump,       'The full path for the sql_dump to load', :type => String, :default => DEFAULT_DB_DUMP
      opt :variant,       "Possible values are snapshot, beta, prerelease, release", :type => String, :default => 'prerelease'
      opt :info,          "Open (load if not yet exist) database and save DB-Info (inkl. elexis/db-version, nr_rows, max/min lastupdate)"
      opt :pry,           "Open a pry debug session with sequel and the defined database"
      opt :run_in_docker, "Run (only --clean --upgrade supported) inside docker, not on the command line", :default => true
      opt :upgrade,       "Download (cached in #{CACHE_BASE}) (Med-)Elexis,
      start it twice and
      visit all views to catch possible errors, NPE, etc"
      opt :use_x11,       "Force to use your display when running. Patches wheezy/docker-compose.yml, too. Handy to debug problems."
      opt :license_file,  'License file to use for Medelexis', :type => String, :default => nil
    end
    result = Trollop::with_standard_exception_handling p do
      p.parse options
    end
    result[:need_to_stop_docker] = true
    self.merge! result
  end
end