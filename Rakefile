$LOAD_PATH.unshift File.dirname(__FILE__)
require 'scripts/version'
require 'rubocop/rake_task'
RuboCop::RakeTask.new

our_directory = File.expand_path(File.dirname(__FILE__))

# Note: Needs FACL support from the filesystem
desc "Allow rwX access on all files under #{our_directory} to container elexis user UID 1200."
task 'set_rw_for_1200' do
  system("-R -m user:1200:rwX #{our_directory}")
end

desc 'Build the docker image'
task :docker_build do
  raise 'docker_build failed!' unless system('scripts/jubularunner.rb docker_build')
end

desc 'Run an interactive bash shell inside docker'
task :docker_run do
  cmd = 'docker run --rm=true --interactive=true --tty=true '
  cmd += " -v #{our_directory}:/home/elexis/"
  cmd += ' --publish=6333:6333 ngiger/jubula_runner'
  raise "docker_run failed! #{cmd}" unless system(cmd)
end

desc 'Install latest snapshot of OpenSource Elexis'
task :elexis_install_os do
  raise 'elexis_install_os failed!' unless system('scripts/install_open_source_elexis.rb')
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
