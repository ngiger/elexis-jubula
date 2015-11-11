#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
rcpSupport = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'rcp-support.zip'))
require 'common'

test2run = ARGV[0] if ARGV.size == 1
test2run ||= 'Screenshot' # by default we use only
puts "We will run #{test2run}"

Dir.chdir(File.join(WorkDir, 'plugins'))
unzip(rcpSupport, 'org.eclipse.jubula.rc.rcp_*.jar')
patch_ini_file_for_jubula_rc

def get_h2_db_params(full_path)
  "-dburl 'jdbc:h2:#{full_path};MVCC=TRUE;AUTO_SERVER=TRUE;DB_CLOSE_ON_EXIT=FALSE' -dbuser 'sa' -dbpw ''"
end
JubulaTestDbParams = get_h2_db_params(File.join(WorkDir, 'database/embedded'))
JubulaTestDataDir  = File.join(WorkDir, 'database/data')

def gen_wrapper_script(wrapper_file)
  exe           = get_full_file_path_or_fail(File.join(WorkDir, @test_params[:exe_name]))
  dataDir = File.join(WorkDir, 'data')
  doc = "#!/bin/sh
#{exe} -data #{dataDir} -config jubula-#{Date.today.strftime('%Y.%m.%d')} -vmargs #{@test_params[:aut_vmargs]}
"
  File.open(wrapper_file, 'w') {|f| f.puts(doc) }
  FileUtils.chmod(0744, wrapper_file)
  puts "#{DryRun ? 'Would create' : 'Created'} wrapper script #{wrapper_file} with content"
  get_full_file_path_or_fail(wrapper_file)
end

def run_test_suite(test2run)
  startTime = Time.now
  @test_params = YAML.load_file(File.join(RootDir, 'definitions', "#{test2run}.yaml"))
  pp @test_params
  path =  File.join(RootDir, 'definitions', "#{test2run}*.xml")
  candidates =  Dir.glob(path)
  unless candidates.size > 0
    puts "Could not find any file using #{path}"
    exit 2
  end

  vers = Config[:jubula_version].to_s
  j_root = Config[:jubula_root]
  test_xml = candidates.last # this should open the latest version of the
  modules = [
    File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_swt_#{vers}.xml"),
    File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_concrete_#{vers}.xml"),
    File.join(Config[:jubula_root], 'examples/testCaseLibrary', "unbound_modules_rcp_#{vers}.xml"),
    test_xml,
    ]
  modules.each { |path| tst = get_full_file_path_or_fail(path)}
  testexec      = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'jubula/testexec'))
  dbtool        = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'jubula/dbtool'))

  autagent      = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autagent'))
  stopautagent  = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/stopautagent'))
  autrun        = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autrun'))

  puts "Found all tools to be able to run #{test_xml}"
  creates = File.join(WorkDir, 'database/embedded.h2.db')
  modules.each {
    |path|
    tst = get_full_file_path_or_fail(path)
    cmd = "#{dbtool} -data #{JubulaTestDataDir} #{JubulaTestDbParams} -import #{path}"
    system(cmd)
    get_full_file_path_or_fail(creates)
  } unless File.exists?(creates)

  puts Config
  Dir.chdir(WorkDir)

  wrapper_file = gen_wrapper_script(File.join(WorkDir, 'runner.bat'))
  portNumber = 60000 + (Process.pid % 1000)
  threads = []
  begin # threads << Thread.new do
    cmd = "#{autagent} -p #{portNumber} &"
    puts "Starting autagent with port #{portNumber}"
    system(cmd)
  end
  sleep 1

  begin # threads << Thread.new do
    autLogFile = File.join(ResultDir, "#{test2run}_aut.log")
    cmd = "#{autrun} #{@test_params[:autrun_params]} --autagentport #{portNumber} --exec #{wrapper_file} & 2>&1 > #{autLogFile}"
    puts "Starting autrun in 1 second: #{cmd}"
    sleep 1
    system(cmd)
  end

# testexec -project  ElexisCore -port 60865 -version 1.1 -testsuite 'TST_UPGRADE' -server localhost -autid elexis
# -resultdir /opt/elexis-3/elexis-3-core/test-results/TST_UPGRADE
# -language  de_DE #
# -dburl 'jdbc:h2:/opt/elexis-3/elexis-3-core/ch.elexis.core.releng/jubula/database/embedded;MVCC=TRUE;AUTO_SERVER=TRUE;DB_CLOSE_ON_EXIT=FALSE' -dbuser 'sa' -dbpw ''
# -datadir /opt/elexis-3/elexis-3-core/test-data
# -data /opt/elexis-3/elexis-3-core/ch.elexis.core.releng/jubula # mayFail false DryRun
  dataDir = File.join(WorkDir, 'jubula/datadir')
  data   = File.join(WorkDir, 'jubula/data')
  [ data, dataDir, ResultDir].each {|path| FileUtils.makedirs(path, :verbose=> true) unless File.directory?(path)}
  begin # threads << Thread.new do
    testExeLogFile = File.join(ResultDir, "#{test2run}_test_exe.log")
    # It must be possible to override all default arguments via the test.yaml!
    cmd = "#{testexec} -port #{portNumber} -server localhost \
-resultdir #{ResultDir} \
-datadir #{dataDir} \
-data #{data} \
#{JubulaTestDbParams} \
#{@test_params[:testexec_params]} \
2>&1 | /usr/bin/tee #{testExeLogFile}"
    sleep 1.5
    puts "Starting testexec: #{cmd}"
    File.open(File.join(WorkDir, 'testexec.tmp'), 'w+') {|f| f.puts cmd }
    system(cmd)

    cmd = "#{stopautagent} -p #{portNumber} -stop"
    puts "Stopping in 1 second autagent via #{cmd}"
    sleep 1
    system(cmd)
  end
ensure
  system("killall --quiet #{@test_params[:exe_name]}")
  diffTime = (Time.now-startTime).to_i
  puts "Running took #{diffTime}  seconds"
end


run_test_suite(test2run)
