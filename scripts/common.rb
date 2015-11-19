#!/usr/bin/env ruby
require 'yaml'
require 'pp'
require 'fileutils'
require 'pry' if Gem::Specification.find_all_by_name('pry').any?
require 'byebug' if Gem::Specification.find_all_by_name('byebug').any?

if ARGV.index('-n')
  DRY_RUN = true
  ARGV.delete('-n')
else
  DRY_RUN = false
end
MAY_FAIL = true

override = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'scripts', 'override', 'defaults.yaml'))
default = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'scripts', 'defaults.yaml'))
Config = {}.merge(YAML.load_file(default))
Config.merge(YAML.load_file(override)) if File.exist?(override)
RootDir = File.expand_path(File.dirname(File.dirname(__FILE__)))
WorkDir = File.expand_path(File.join(Dir.pwd, Config[:workdir]))
FileUtils.makedirs(WorkDir) unless File.exist?(WorkDir)

WINDOWS_REGEXP = /mingw|bccwin|wince|cygwin|mswin32/i
MACOSX_REGEXP  = /macos|darwin/i

def unzip(zip_file, should_create)
  return if Dir.glob(should_create).size > 0
  puts "Unzipping #{zip_file}"
  return if DRY_RUN
  system("unzip -o #{zip_file}", MAY_FAIL) # sometimes it returns bogus errors
  puts "Unzipped #{zip_file}"
  fail "unzip did not create #{should_create}" unless Dir.glob(should_create).size > 0
end

def download_if_not_exist(dest_dir, src)
  filename = File.join(dest_dir, File.basename(src))
  return true if File.exist?(filename) && File.size(filename) > 0
  puts "getting from #{src} -> #{File.expand_path(filename)}"
  return true if DRY_RUN
  if src.index('http') == 0
    require 'open-uri'
    write_out = open(filename, 'wb')
    write_out.write(open(src).read)
    write_out.close
  else
    FileUtils.cp(src, dest_dir, verbose: true)
  end
end

def download_and_unzip(zip_url, should_create)
  return if Dir.chdir(WorkDir) && Dir.glob(should_create).size > 0
  zip_file = File.basename(zip_url)
  unless File.exist?(zip_file)
    puts "Downloading #{zip_url}"
    system("wget --quiet  --no-check-certificat #{zip_url}")
  end
  puts should_create
  puts File.expand_path should_create
  unzip(zip_file, should_create)
end

# Will rais an error if file with path cannot be found
def get_full_file_path_or_fail(path)
  unless File.exist?(path)
    fail "Failing as I could not find the specified file #{path}"
  end unless DRY_RUN
  File.expand_path(path)
end

def patch_acl_for_elexis_and_current_user(force=false)
  return unless force && `getfacl #{RootDir} | grep user:1200`
  ['1200', ENV['USER']].each do |user|
    system("setfacl -R -m user:#{user}:rwX #{RootDir}")
    system("setfacl -d -m user:#{user}:rwX #{RootDir}")
  end
end

def patch_ini_file_for_jubula_rc
  return if DRY_RUN
  ini_name = Dir.glob(File.join(WorkDir, '**/configuration/config.ini')).first
  return if File.exist?(ini_name + '.bak')
  fail 'Must first install Elexis before patching the configuration/config.ini' unless ini_name
  jar_path = File.join(WorkDir, '**/plugins/*jubula.rc.rcp_*.jar')
  jubula_jar = Dir.glob(jar_path).first
  fail "Could not find Jubula RCP support jar using #{jar_path}" unless jubula_jar && File.exist?(jubula_jar)
  jubula_jar.sub!(WorkDir + '/', '') if jubula_jar
  config_ini = IO.readlines(ini_name)
  FileUtils.cp(ini_name, ini_name + '.bak', verbose: true) unless
  config_ini.each do |line|
    next unless /^osgi.bundles=/.match(line)
    line.sub!(/osgi.bundles=/, 'osgi.bundles=reference\:file\:' + File.basename(jubula_jar) + '@4\:start,')
    File.open(ini_name, 'w') { |file| file.write config_ini.join('') }
    return true
  end
  fail "Could not find line osgi.bundle in #{File.expand_path(ini_name)}"
end

def docker_build(docker_dir = File.join(RootDir, 'wheezy'))
  puts "docker_build from #{docker_dir}"
  download_if_not_exist(docker_dir, 'http://download.elexis.info/jubula/8.2/autagent_8_2_linux_x86_64.zip')
  FileUtils.cp(File.join(RootDir, 'Gemfile'), docker_dir, verbose: true)
  docker_name = Config[:docker_name] || 'ngiger/jubula_runner'
  system("docker build -t #{docker_name} #{docker_dir}")
end

def patch_ruby(cmd)
  if WINDOWS_REGEXP.match(RbConfig::CONFIG['host_os'])
    #  cmd.gsub!("/", "\\")
    cmd = 'start ' + cmd[0..-2] if cmd[-1..-1].eql?('&')
  else
    my_ruby = `which ruby`.chomp
    if /^ruby$/.match(cmd.split(' ')[0])
      return cmd.sub(/^ruby/, my_ruby)
    elsif /.rb$/.match(cmd.split(' ')[0])
      return my_ruby + ' ' + cmd
    end
  end
end

def system(cmd, may_fail = false)
  cmd2history = "#{cmd}#{may_fail ? '# may_fail' : ''}"
  puts cmd2history
  return true if DRY_RUN
  full_cmd = "cd #{Dir.pwd} && " + cmd
  puts full_cmd if $VERBOSE
  res = Kernel.system(full_cmd)
  return true if res
  puts Dir.pwd
  puts "Dir.cmd and #{res} may fail #{may_fail}"
  fail(cmd) unless may_fail
end

def sleep(nr_seconds)
  if DRY_RUN
    puts "sleep #{nr_seconds} # seconds"
  else
    Kernel.sleep(nr_seconds)
  end
end
