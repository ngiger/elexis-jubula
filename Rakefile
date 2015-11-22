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
  cmd += " --publish=6333:6333 ngiger/jubula_runner:#{Elexis_Jubula::VERSION}"
  fail "docker_run failed! #{cmd}" unless system(cmd)
end

desc 'Install latest snapshot of OpenSource Elexis'
task :elexis_install_os do
  fail 'elexis_install_os failed!' unless system('scripts/install_open_source_elexis.rb')
end

desc 'Run Jubula-GUI tests for Elexis OpenSource'
task :jubula_screenshot do
  fail 'Running failed' unless system('scripts/jubularunner.rb Screenshot')
end

desc 'Run Jubula-GUI tests via Maven'
task :jubula_mvn => :elexis_install_os do
  begin
    # The next 5 lines are just for making https://srv.elexis.info/jenkins/job/Elexis-3.0-Jubula-Matrix-Linux
    # work with minimal fuss
    src = File.join(Dir.pwd, 'work', 'ch.elexis.core.p2site-3.1.0-SNAPSHOT-linux.gtk.x86_64.zip')
    dst = File.join(Dir.pwd, 'work', 'ch.elexis.core.application.ElexisApp-linux.gtk.x86_64.zip')
    if File.exist?(src) && !File.exist?(dst)
      FileUtils.ln_s(src, dst)
    end
    port = 6333 # Don't change it or via xvfb you will have problems!
    autagent = get_full_file_path_or_fail(File.join(Config[:jubula_root], 'server/autagent'))
    fail "Could not start autagent" unless system("#{autagent} start -p #{port} &")

    ARGV.delete('jubula_mvn')
    cmd = "mvn integration-test  -Dtest=ch.ngiger.jubula.testsuites.#{ARGV[0]}"
    fail 'Running mvn failed' unless system(cmd)
  ensure
    system("#{autagent} -stop localhost -p #{port}")
  end
end

desc 'Build, commit, tag, push && docker push the current state'
task :docker_publish do
  puts "Publishing #{Elexis_Jubula::Version} to docker"
#  system("git commit -m 'Publishing #{Elexis_Jubula::Version}'")
  puts "Log-In to to docker"
  raise "login to docker failed" unless system("docker login")
#  raise "git tagging failed" unless system("git tag #{Elexis_Jubula::Version}")
#  raise "git push failed" unless system("git push --tags")
  raise "Tagging failed" unless system( "docker tag ngiger/jubula_runner ngiger/jubula_runner:#{Elexis_Jubula::Version}")
  cmd = "docker push ngiger/jubula_runner:#{Elexis_Jubula::Version}"
  puts cmd
  raise "Pushing to docker failed" unless system(cmd)
end
require 'rake/clean'
CLEAN.include FileList['work/**']
CLEAN.include FileList['results/**']
