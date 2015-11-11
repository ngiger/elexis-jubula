#!/usr/bin/env ruby
require 'yaml'
require 'pp'
require 'fileutils'
begin
  require 'pry'
rescue LoadError
  # ignore err if no debugger could be loaded
end

DryRun    = false

cfg       = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'config.yaml'))
default   = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'defaults.yaml'))
defaults  = YAML.load_file(default)
Config    =  {}.merge(YAML.load_file(default).merge(YAML.load_file(cfg)))
RootDir   = File.expand_path(File.dirname(File.dirname(__FILE__)))
WorkDir   = File.expand_path(File.join(Dir.pwd, Config[:workdir]))
ResultDir = File.expand_path(Config[:workdir] || File.join(RootDir, 'results'))
FileUtils.makedirs(WorkDir) unless File.exists?(WorkDir)

def unzip(zipFile, should_create)
  return if Dir.glob(should_create).size > 0
  puts "Unzipping #{zipFile}"
  exit 2 unless system("unzip #{zipFile}")
  puts "Unzipped #{zipFile}"
  exit 2 unless Dir.glob(should_create).size > 0
end

def download_and_unzip(zipUrl, should_create)
  Dir.chdir(WorkDir)
  return if Dir.glob(should_create).size > 0
  zipFile = File.basename(zipUrl)
  unless File.exists?(zipFile)
    puts "Downloading #{zipUrl}"
    unless system("wget --quiet  --no-check-certificat #{zipUrl}")
      puts "Failed!"
      exit 2
    end
    puts "Downloaded #{zipUrl}"
  end
  unzip(zipFile, should_create)
end

# Will exit with status 2 if File cannot be found
def get_full_file_path_or_fail(path)
  unless File.exists?(path)
    puts "Failing as I could not find the specified file #{path}"
    exit 2
  end
  File.expand_path(path)
end

def patch_ini_file_for_jubula_rc
  ini_name = Dir.glob(File.join(WorkDir, '**/configuration/config.ini')).first
  jar_path = File.join(WorkDir, '**/plugins/*jubula.rc.rcp_*.jar')
  jubula_jar  = Dir.glob(jar_path).first
  unless jubula_jar and File.exists?(jubula_jar)
    puts "Could not find Jubula RCP support jar using #{jar_path}"
    exit 2
  end
  jubula_jar.sub!(WorkDir+'/', '') if jubula_jar

  config_ini = IO.readlines(ini_name)
  needsJubulaRcpSupport = config_ini.find{|x| x.index(jubula_jar) } == nil
  puts "#{File.expand_path(ini_name)}: #{needsJubulaRcpSupport ? ' Will patch to add' : ' Already patched to'} start " + jubula_jar
  if needsJubulaRcpSupport
    FileUtils.cp(ini_name, ini_name + '.bak', :verbose => true);
    found = false
    config_ini.each{
      |line|
        if /^osgi.bundles=/.match(line)
          found = true
          puts line if $VERBOSE
          line.sub!(/osgi.bundles=/, 'osgi.bundles='+rcpStart )
          break
        end
    }
    raise "Could not find line osgi.bundle in #{File.expand_path(ini_name)}" unless found
    File.open(ini_name, 'w') { |file| file.write config_ini.join('') }
  end
end