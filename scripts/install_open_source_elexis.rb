#!/usr/bin/env ruby
require 'yaml'
require 'pp'
require 'fileutils'

cfg = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'config.yaml'))
default = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'defaults.yaml'))
defaults = YAML.load_file(default)
config = {}
config= YAML.load_file(default).merge(YAML.load_file(cfg))
require 'pry'

WorkDir = File.expand_path(File.join(Dir.pwd, config[:workdir]))
InstallDir = File.join(WorkDir, 'install')
FileUtils.makedirs(WorkDir) unless File.exists?(WorkDir)

def download_and_unzip(zipUrl, should_create)
  Dir.chdir(WorkDir)
  return if File.exists?(should_create)
  dest = File.basename(zipUrl)
  unless File.exists?(dest)
    puts "Downloading #{zipUrl}"
    exit 2 unless system("wget --quiet #{zipUrl}")
    puts "Downloaded #{zipUrl}"
  end
  puts "Unzipping #{dest}"
  exit 2 unless system("unzip #{dest}")
  puts "Unzipped #{dest}"
  exit 2 unless  File.exists?(should_create)
end

download_and_unzip(config[:elexis_fsf][:full_zip_url], File.join(WorkDir, 'plugins'))
download_and_unzip(config[:director_latest], File.join(WorkDir, 'director'))
toInstall = config[:elexis_fsf][:features_2_install]
cmd = "#{WorkDir}/director/director \
  -profile Elexis \
  -d #{WorkDir} \
  -repository #{toInstall.keys.join  (','   )} \
  -installIUs #{toInstall.values.join(' -i ')}
"
unless (elexis = Dir.glob("*lexis*.ini")).size > 0
  puts "Calling director with #{cmd}"
  exit 2 unless system(cmd)
end
Elexis = elexis[0].sub('.ini', '')
puts "elexis seems to be installed as #{Elexis}"
