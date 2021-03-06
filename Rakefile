$LOAD_PATH.unshift File.dirname(__FILE__)
require 'lib/version'
require 'lib/common'

our_directory = File.expand_path(File.dirname(__FILE__))

desc 'Build the docker image'
task :docker_build do
  unless system('bin/jubularunner.rb --build-docker', :may_fail => true)
    fail 'docker_build failed!'
  end
  something_to_commit = `git status -uno --porcelain wheezy`
  if something_to_commit.length > 0
    puts "We will force the tag  #{ElexisJubula::VERSION}"
    system('git commit wheezy')
    Kernel.system("git tag -f #{ElexisJubula::VERSION}")
  else
    puts "build of #{ElexisJubula::NAME}:#{ElexisJubula::VERSION} is uptodate"
  end
end

desc 'Run an interactive bash shell inside docker'
task :docker_run do
  cmd = 'docker run --rm=true --interactive=true --tty=true '
  cmd += " -v #{our_directory}:/home/elexis/"
  cmd += " --publish=6333:6333 #{ElexisJubula::NAME}:#{ElexisJubula::VERSION}"
  fail "docker_run failed! #{cmd}" unless system(cmd)
end

desc 'Run Elexis inside docker'
task :docker_elexis do
  system('bin/jubularunner.rb elexis_inside_docker')
end

if  ENV['VARIANT']
  VARIANT ||= ENV['VARIANT']
  desc "Install latest #{VARIANT} (as specified by env variable VARIANT) of OpenSource Elexis"
else
  VARIANT ||= 'master'
  desc 'Install latest master of OpenSource Elexis'
end
desc "Install Elexis Opensource. Branch default to master, unless overriden via environment variable VARIANT #{ENV['VARIANT']}"
task :elexis_install_os do
  fail 'elexis_install_os failed!' unless system('scripts/install_open_source_elexis.rb')
end

common_options = "\n# to run with a specific database use environment variables, e.g.
export db_load_script=scratch.sql
export db_connection=jdbc:postgresql://servername:serverport/db_name
# Note: database user elexisTest with password elexisTest must have all required priviledges to modify the database
# Note: postgres db users must also export PGPASSWORD=elexisTest
Alternatively you may set them for a given test in its definitions/<name>.yaml

export USE_X11=1 # to see the Elexis running during the tests
"


desc 'Run Jubula-GUI test (default Screenshot) for Elexis OpenSource via jubularunner'+ common_options
task :jubula_test, [:test_to_run] => :elexis_install_os do |_target, args|
  test_to_run = args[:test_to_run]
  test_to_run ||= 'Screenshot'
  # TODO: publish signed image and ensure that it can be
  system('bin/jubularunner.rb docker_build') unless system('docker images #{ElexisJubula::NAME}', :may_fail => true)
  fail 'Running failed' unless system("bin/jubularunner.rb #{test_to_run} --no-run-in-docker")
end

desc 'Run Jubula-GUI test (default Screenshot) for Elexis OpenSource via docker'+ common_options
task :jubula_docker, [:test_to_run] do |_target, args|
  test_to_run = args[:test_to_run]
  test_to_run ||= 'Screenshot'
  fail 'Running failed' unless system("bin/jubularunner.rb #{test_to_run}")
end

desc 'Run Jubula-GUI test (default Screenshot) via Maven' + common_options
task :jubula_mvn, [:test_to_run, :via_xvfb] => :elexis_install_os do |_target, args|
  saved_dir = Dir.pwd
  begin
    test_to_run = args[:test_to_run] ? args[:test_to_run] : 'Smoketest'
    via_xvfb = !!args[:via_xvfb]
    # The next 5 lines are just for making https://srv.elexis.info/jenkins/job/Elexis-3.0-Jubula-Matrix-Linux
    # work with minimal fuss
    src = File.join(Dir.pwd, 'work', 'ch.elexis.core.p2site-3.1.0-SNAPSHOT-linux.gtk.x86_64.zip')
    dst = File.join(Dir.pwd, 'work', 'ch.elexis.core.application.ElexisApp-linux.gtk.x86_64.zip')
    FileUtils.rm_rf(File.join(ENV['HOME'], 'elexis', 'logs'), verbose: true)
    FileUtils.rm_rf(File.join(ENV['HOME'], 'elexis', 'elexislock.*'), verbose: true)
    FileUtils.rm_rf(File.join(Dir.pwd, 'workdir'), verbose: true)
    FileUtils.rm_rf(File.join(Dir.pwd, 'workspace'), verbose: true)
    FileUtils.ln_s(src, dst) if File.exist?(src) && !File.exist?(dst)
    puts "Before calling mvn #{Dir.pwd} saved_dir #{saved_dir} test_to_run #{test_to_run}"
    unless via_xvfb
      xvfb_thread = nil
      meat_thread = nil
    else
      ENV['DISPLAY']=JubulaRunner::DISPLAY
      xvfb_thread = Thread.new do
        puts "Starting Xvfb via #{JubulaRunner::START_XVFB_CMD}"
        system(JubulaRunner::START_XVFB_CMD)
        puts 'Done with xvfb_thread'
      end
      sleep 1
      meat_thread = Thread.new do
        puts "Starting meta_city via #{JubulaRunner::START_META_CMD}"
        puts JubulaRunner::START_META_CMD
        system(JubulaRunner::START_META_CMD)
        puts 'Done with meat_thread'
      end
    end
    Dir.chdir saved_dir
    cmd = "pwd && mvn clean integration-test -Dtest_to_run=#{test_to_run}"
    cmd += "-DDISPLAY=#{JubulaRunner::DISPLAY}" if via_xvfb
    puts "Will call #{cmd}"
    fail 'Running mvn failed' unless system(cmd)
  ensure
    if xvfb_thread
      puts 'Must stop xvfb_thread'
      xvfb_thread.exit
    end
    meat_thread.exit if meat_thread
  end
end

desc 'Build, commit, tag, push && docker push the current state'
task docker_publish: :docker_build do
  fullname = "#{ElexisJubula::NAME}:#{ElexisJubula::VERSION}"
  cmds = [
    "docker push #{fullname}",
    "docker tag  #{fullname} #{ElexisJubula::NAME}:latest",
    "docker push #{ElexisJubula::NAME}:latest",
    ]
  cmds.each do |cmd|
    unless system(cmd, :may_fail => true)
      puts "To build. we use the following commands:\n  " + cmds.join("\n  ")
      puts "we failed in #{cmd}"
      fail
    end
  end
  puts "Pushed #{fullname} to docker"
end
require 'rake/clean'
CLEAN.include FileList['work/**']
CLEAN.include FileList['results/**']
