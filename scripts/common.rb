#!/usr/bin/env ruby
require 'yaml'
require 'pp'
require 'fileutils'
require 'pry' if Gem::Specification.find_all_by_name('pry').any?
require 'byebug' if Gem::Specification.find_all_by_name('byebug').any?

DRY_RUN = false

override = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'scripts', 'override', 'defaults.yaml'))
default = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'scripts', 'defaults.yaml'))
Config = {}.merge(YAML.load_file(default).merge(YAML.load_file(override)))
RootDir = File.expand_path(File.dirname(File.dirname(__FILE__)))
WorkDir = File.expand_path(File.join(Dir.pwd, Config[:workdir]))
ResultDir = File.expand_path(Config[:workdir] || File.join(RootDir, 'results'))
FileUtils.makedirs(WorkDir) unless File.exist?(WorkDir)

WINDOWS_REGEXP = /mingw|bccwin|wince|cygwin|mswin32/i
MACOSX_REGEXP  = /macos|darwin/i

def unzip(zip_file, should_create)
  return if Dir.glob(should_create).size > 0
  puts "Unzipping #{zip_file}"
  exit 2 unless system("unzip #{zip_file}")
  puts "Unzipped #{zip_file}"
  exit 2 unless Dir.glob(should_create).size > 0
end

def downloadIfNotExists(dest_dir, src)
  filename = File.join(dest_dir, File.basename(src))
  return if File.exist?(filename) && File.size(filename) > 0
  if src.index('http') == 0
    puts "getting from #{src} -> #{File.expand_path(filename)}"
    return if DRY_RUN
    require 'open-uri'
    writeOut = open(filename, "wb")
    writeOut.write(open(src).read)
    writeOut.close
  else
    FileUtils.cp(src, dest_dir, verbose: true)
  end
end

def download_and_unzip(zip_url, should_create)
  return if Dir.chdir(WorkDir) && Dir.glob(should_create).size > 0
  zip_file = File.basename(zip_url)
  unless File.exist?(zip_file)
    puts "Downloading #{zip_url}"
    unless system("wget --quiet  --no-check-certificat #{zip_url}")
      puts 'Failed!'
      exit 2
    end
  end
  unzip(zip_file, should_create)
end

# Will exit with status 2 if File cannot be found
def get_full_file_path_or_fail(path)
  unless File.exist?(path)
    puts "Failing as I could not find the specified file #{path}"
    exit 2
  end
  File.expand_path(path)
end

def patch_ini_file_for_jubula_rc
  ini_name = Dir.glob(File.join(WorkDir, '**/configuration/config.ini')).first
  jar_path = File.join(WorkDir, '**/plugins/*jubula.rc.rcp_*.jar')
  jubula_jar = Dir.glob(jar_path).first
  unless jubula_jar && File.exist?(jubula_jar)
    puts "Could not find Jubula RCP support jar using #{jar_path}"
    exit 2
  end
  jubula_jar.sub!(WorkDir + '/', '') if jubula_jar
  return if File.exist?(ini_name + '.bak')
  config_ini = IO.readlines(ini_name)
  FileUtils.cp(ini_name, ini_name + '.bak', verbose: true) unless
  config_ini.each do |line|
    next unless /^osgi.bundles=/.match(line)
    puts line if $VERBOSE
    line.sub!(/osgi.bundles=/, 'osgi.bundles=' + rcpStart)
    File.open(ini_name, 'w') { |file| file.write config_ini.join('') }
    return true
  end
  fail "Could not find line osgi.bundle in #{File.expand_path(ini_name)}"
end

def docker_build(docker_dir = File.join(RootDir, 'wheezy'))
  puts "docker_build from #{docker_dir}"
  downloadIfNotExists(docker_dir, 'http://download.elexis.info/jubula/8.2/autagent_8_2_linux_x86_64.zip')
  FileUtils.cp(File.join(RootDir, 'Gemfile'), docker_dir, verbose: true)
  docker_name = Config[:docker_name] || 'ngiger/jubula_runner'
  system("docker build -t #{docker_name} #{docker_dir}")
end

def system(cmd, may_fail = false)
  if WINDOWS_REGEXP.match(RbConfig::CONFIG['host_os'])
    #  cmd.gsub!("/", "\\")
    cmd = 'start ' + cmd[0..-2] if cmd[-1..-1].eql?('&')
  else
    my_ruby = `which ruby`.chomp
    if /^ruby$/.match(cmd.split(' ')[0])
      cmd.sub!(/^ruby/, my_ruby)
    elsif /.rb$/.match(cmd.split(' ')[0])
      cmd = my_ruby + ' ' + cmd
    end
  end
  cmd2history = "date && cd #{Dir.pwd} && #{cmd} # may_fail #{may_fail} #{DRY_RUN ? 'DRY_RUN' : ''}"
  puts cmd2history
  if DRY_RUN then return true
  else
    puts cmd if $VERBOSE
    res = Kernel.system(cmd)
  end
  if !res && !may_fail
    puts "running #{cmd} #{may_fail} failed"
    return false
  end
  res
end

def sleep(nr_seconds)
  if DRY_RUN
    puts "sleep #{nr_seconds} # seconds"
  else
    Kernel.sleep(nr_seconds)
  end
end
