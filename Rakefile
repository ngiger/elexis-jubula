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

desc 'Build, commit, tag, push && docker push the current state'
task :docker_publish do
  puts "Publishing #{Elexis_Jubula::VERSION} to docker"
  system("git commit -m 'Publishing #{Elexis_Jubula::VERSION}'", MAY_FAIL)
  puts 'Log-In to to docker'
  system('docker login')
  system("git tag #{Elexis_Jubula::VERSION}")
  system('git push --tags')
  cmd = "docker tag ngiger/jubula_runner ngiger/jubula_runner:#{Elexis_Jubula::VERSION}"
  system(cmd)
  cmd = "docker push ngiger/jubula_runner:#{Elexis_Jubula::VERSION}"
  system(cmd)
end
require 'rake/clean'
CLEAN.include FileList['work/**']
CLEAN.include FileList['results/**']
