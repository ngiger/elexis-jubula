$LOAD_PATH.unshift File.dirname(__FILE__)
require 'scripts/version'
require 'scripts/common'
require 'rubocop/rake_task'
RuboCop::RakeTask.new

our_directory = File.expand_path(File.dirname(__FILE__))

# Note: Needs FACL support from the filesystem
# Note: 1200 is the UID used in the dockerfile for the user elexis
desc "Allow rwX access on all files under #{our_directory} to container elexis user UID 1200."
task 'set_rw_for_1200' do
  patch_acl_for_elexis_and_current_user(true)
end

desc 'Build the docker image'
task :docker_build do
  fail 'docker_build failed!' unless system('scripts/jubularunner.rb docker_build')
end

desc 'Run an interactive bash shell inside docker'
task :docker_run do
  cmd = 'docker run --rm=true --interactive=true --tty=true '
  cmd += " -v #{our_directory}:/home/elexis/"
  cmd += " --publish=6333:6333 ngiger/jubula_runner:#{ElexisJubula::VERSION}"
  fail "docker_run failed! #{cmd}" unless system(cmd)
end

desc 'Install latest snapshot of OpenSource Elexis'
task :elexis_install_os do
  fail 'elexis_install_os failed!' unless system('scripts/install_open_source_elexis.rb')
end

desc 'Run Jubula-GUI test (default Screenshot) for Elexis OpenSource locally'
task :jubula_test, [:test_to_run] => :elexis_install_os do  |target, args|
  test_to_run =  args[:test_to_run]
  test_to_run ||= 'Screenshot'
  # TODO: publish signed image and ensure that it can be
  system('scripts/jubularunner.rb docker_build') unless system('docker images ngiger/jubula_runner', MAY_FAIL)
  fail 'Running failed' unless system("scripts/jubularunner.rb #{test_to_run}")
end

desc 'Run Jubula-GUI test (default Screenshot) for Elexis OpenSource via docker'
task :jubula_docker, [:test_to_run] do  |target, args|
  test_to_run =  args[:test_to_run]
  test_to_run ||= 'Screenshot'
  fail 'Running failed' unless system("scripts/jubularunner.rb #{test_to_run} run_in_docker")
end

desc 'Run Jubula-GUI test (default Screenshot) via Maven'
task :jubula_mvn, [:test_to_run] => :elexis_install_os do  |target, args|
  port = 6333 # Don't change it or via xvfb you will have problems!
  savedDir = Dir.pwd
  begin
    args.with_default(:test_to_run  => 'Screenshot')
  test_to_run =  args[:test_to_run]
    test_to_run ||= 'Screenshot'
    # The next 5 lines are just for making https://srv.elexis.info/jenkins/job/Elexis-3.0-Jubula-Matrix-Linux
    # work with minimal fuss
    src = File.join(Dir.pwd, 'work', 'ch.elexis.core.p2site-3.1.0-SNAPSHOT-linux.gtk.x86_64.zip')
    dst = File.join(Dir.pwd, 'work', 'ch.elexis.core.application.ElexisApp-linux.gtk.x86_64.zip')
    FileUtils.rm_rf(File.join(ENV['HOME'], 'elexis', 'logs'), :verbose => true)
    FileUtils.rm_rf(File.join(ENV['HOME'], 'elexis', 'elexislock.*'), :verbose => true)
    FileUtils.rm_rf(File.join(Dir.pwd, 'workdir'), :verbose => true)
    FileUtils.rm_rf(File.join(Dir.pwd, 'workspace'), :verbose => true)
    if File.exist?(src) && !File.exist?(dst)
      FileUtils.ln_s(src, dst)
    end
    puts "Before calling mvn #{Dir.pwd} savedDir #{savedDir} test_to_run #{test_to_run}"
    Dir.chdir savedDir
    cmd = "pwd && mvn clean integration-test  -Dtest=ch.ngiger.jubula.testsuites.#{test_to_run}"
    puts "Will call #{cmd}"
    fail 'Running mvn failed' unless system(cmd)
  end
end

desc 'Build, commit, tag, push && docker push the current state'
task :docker_publish do
  puts "Publishing #{ElexisJubula::Version} to docker"
#  system("git commit -m 'Publishing #{ElexisJubula::Version}'")
  puts "Log-In to to docker"
  raise "login to docker failed" unless system("docker login")
#  raise "git tagging failed" unless system("git tag #{ElexisJubula::Version}")
#  raise "git push failed" unless system("git push --tags")
  raise "Tagging failed" unless system( "docker tag ngiger/jubula_runner ngiger/jubula_runner:#{ElexisJubula::Version}")
  cmd = "docker push ngiger/jubula_runner:#{ElexisJubula::Version}"
  puts cmd
  raise "Pushing to docker failed" unless system(cmd)
end
require 'rake/clean'
CLEAN.include FileList['work/**']
CLEAN.include FileList['results/**']
