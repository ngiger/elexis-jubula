#!/usr/bin/env ruby
require 'yaml'
require 'pp'
require 'fileutils'
require 'pry' if Gem::Specification.find_all_by_name('pry').any?
require 'byebug' if Gem::Specification.find_all_by_name('byebug').any?

$LOAD_PATH.unshift File.dirname(__FILE__)
require 'version'
VARIANT = ENV['VARIANT'] ? ENV['VARIANT'] : 'snapshot'

if ARGV.index('-n')
  DRY_RUN = true
  ARGV.delete('-n')
else
  DRY_RUN = false
end
MAY_FAIL = true

def java_triplet
  cfg = { 'cpu' => RbConfig::CONFIG['target_cpu'] }
  case RbConfig::CONFIG['host_os']
  when WINDOWS_REGEXP
    cfg['os'] = 'windows'
    cfg['win'] = 'win32'
  when /linux/i
    cfg['os'] = 'linux'
    cfg['win'] = 'gtk'
    cfg['cpu'] if /i.86/.match(cfg['cpu']) # needed for i486 on Windows/linux-x86
  when /sunos|solaris/i
    # Solaris
  when MACOSX_REGEXP
    cfg['os'] = 'macosx'
    cfg['win'] = 'cocoa'
    cfg['cpu'] = 'x86_64'
  else
    puts "unknown RbConfig::CONFIG['host_os'] #{RbConfig::CONFIG['host_os']}"
    exit 3
  end
  cfg
end

override = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'scripts', 'override', 'defaults.yaml'))
default = File.expand_path(File.join(File.dirname(File.dirname(__FILE__)), 'scripts', 'defaults.yaml'))
Config = {}.merge(YAML.load_file(default))
Config.merge(YAML.load_file(override)) if File.exist?(override)
RootDir = File.expand_path(File.dirname(File.dirname(__FILE__)))
WorkDir = File.expand_path(File.join(Dir.pwd, Config[:workdir]))
FileUtils.makedirs(WorkDir) unless File.exist?(WorkDir)

WINDOWS_REGEXP = /mingw|bccwin|wince|cygwin|mswin32/i
MACOSX_REGEXP  = /macos|universal|darwin/i

def macos?
  MACOSX_REGEXP.match(RbConfig::CONFIG['host_os'])
end

def windows?
  WINDOWS_REGEXP.match(RbConfig::CONFIG['host_os'])
end

def unzip(zip_file, should_create)
  return if Dir.glob(should_create).size > 0
  puts "Unzipping #{zip_file}"
  return if DRY_RUN
  system("unzip -q -o #{zip_file}", MAY_FAIL) # sometimes it returns bogus errors
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
    cmd = "wget  --quiet  --no-check-certificat #{zip_url}"
    cmd = "curl  --silent --insecure --output #{File.basename(zip_url)} #{zip_url}" if macos?
    system(cmd)
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

def prepare_medelexis(inst_dir)
  if Dir.glob(File.join(inst_dir, 'plugins', 'ch.medelexis.application_*.jar')).size > 0
    prefs = File.join(inst_dir, 'configuration', '.settings', 'MedelexisDesk.prefs')
    unless File.exist?(prefs)
      FileUtils.makedirs(File.dirname(prefs))
      File.open(prefs, 'w+') do |f|
        f.puts "eclipse.preferences.version=1
usageConditionAcceptanceDate=#{Time.now}
usageConditionAccepted=true"
      end
      puts "created #{prefs}"
    end
    license_from = File.join(ENV['HOME'], 'medelexis_jubula_license.xml')
    license_to = File.join(ENV['HOME'], 'elexis', 'license.xml')
    unless File.exist?(license_to)
      FileUtils.makedirs(File.dirname(license_to))
    end
    unless File.exist?(license_from)
      puts "Cannot continue without a valid #{license_from}"
      exit 1
    end
    FileUtils.cp(license_from, license_to, verbose: true) unless File.exist?(license_to)
  end
end

def install_rcp_support_for_jubula(inst_dir)
  return if DRY_RUN
  rcp_support = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'rcp-support.zip'))
  dropins = File.join(inst_dir, 'dropins', 'plugins')
  FileUtils.makedirs(dropins, :verbose => true)
  Dir.chdir(dropins)
  unzip(rcp_support, 'org.eclipse.jubula.rc.rcp_*.jar')
end

def patch_ini_file_for_jubula_rc(inst_dir)
  return if DRY_RUN
  ini_name = Dir.glob(File.join(inst_dir, 'configuration/config.ini')).first
  return if File.exist?(ini_name + '.bak')
  fail 'Must first install Elexis before patching the configuration/config.ini' unless ini_name
  jar_path = File.join(WorkDir, '**/plugins/*jubula.rc.rcp_*.jar')
  jubula_jar = Dir.glob(jar_path).first
  fail "Could not find Jubula RCP support jar using #{jar_path}" unless jubula_jar && File.exist?(jubula_jar)
  jubula_jar.sub!(WorkDir + '/', '') if jubula_jar
  bundles_info = File.join(WorkDir, 'configuration/org.eclipse.equinox.simpleconfigurator/bundles.info')
  if File.exist?(bundles_info)
    puts "Patching #{bundles_info}"
    info = IO.read(bundles_info)
    File.open(bundles_info, 'w') do |file|
      file.write info;
      parts = File.basename(jubula_jar, '.jar').split('_')
      line = "#{parts[0]},#{parts[1]},plugins/#{ File.basename(jubula_jar)},3,true"
      puts line
      file.puts line
      file.puts "# patched by #{__FILE__} at #{Time.now}"
      file.close
      system("tail #{bundles_info}")
    end
  else
    config_ini = IO.readlines(ini_name)
    FileUtils.cp(ini_name, ini_name + '.bak', verbose: true) unless File.exist?(ini_name + '.bak')
    config_ini.each do |line|
      next unless /^osgi.bundles=/.match(line)
      line.sub!(/osgi.bundles=/, 'osgi.bundles=reference\:file\:../dropins/plugins/' + File.basename(jubula_jar) + '@3\:start,')
      File.open(ini_name, 'w') { |file| file.write config_ini.join(''); file.puts "# patched by #{__FILE__} at #{Time.now}" }
      return true
    end
    fail "Could not find line osgi.bundle in #{File.expand_path(ini_name)}"
  end
end

def docker_build(docker_dir = File.join(RootDir, 'wheezy'))
  puts "docker_build from #{docker_dir}"
  FileUtils.cp(File.join(RootDir, 'Gemfile'), docker_dir, verbose: true)
  docker_name = Config[:docker_name] || ElexisJubula::NAME
  cmd = "docker build -t #{docker_name}:#{ElexisJubula::VERSION} #{docker_dir}"
  system(cmd)
  puts "Built using #{cmd}"
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
  if DRY_RUN
    puts cmd2history
    return true
  end
  full_cmd = "cd #{Dir.pwd} && " + cmd
  res = Kernel.system(full_cmd)
  return true if res
  puts Dir.pwd
  puts "Dir.cmd #{Dir.pwd} and #{res} may fail #{may_fail}"
  fail(cmd) unless may_fail
end

def sleep(nr_seconds)
  if DRY_RUN
    puts "sleep #{nr_seconds} # seconds"
  else
    Kernel.sleep(nr_seconds)
  end
end
