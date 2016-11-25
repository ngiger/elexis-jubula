#!/usr/bin/env ruby
# Copyright (c) Niklaus Giger, 2016
# License EPL v1.0
# Needs the following debian packages: x11-apps imagemagick xdotool scrot

require 'fileutils'

if ARGV.size != 3
  puts "Expecting three arguments: MEDELEXIS_EXE VARIANT RESULT_DIR"
  exit 3
end
MEDELEXIS_EXE = ARGV[0]
VARIANT=ARGV[1]
RESULT_DIR = ARGV[2]
MAX_WAIT = 120
FLAG_FILE = File.join(RESULT_DIR, File.basename(__FILE__, '.rb') + '.done')
PASSWORD_FILE = File.expand_path('~') + '/.medelexis.dummy.password'
ACCEPTED_LICENSE  =  File.dirname(MEDELEXIS_EXE)+ '/configuration/.settings/MedelexisDesk.prefs'
LICENSE_ORIGIN    =  File.expand_path('~') +'/medelexis_jubula_license.xml'
LICENSE_INSTALLED =  File.expand_path('~') +'/elexis/license.xml'

$errors = 0
$sw_errors = 0

PROBLEMATIC_WINDOW_TITLES = [
  'InfoBox not proper private key', # eg. priaid
  'Install',
  'Update', # Update Error prerelease -> altes release updaten
  'Problem Occurred', # eg. 'Additional p2 locations' has encounter a problem
  'Multiple problems have occurred', # eg. Several Installing
]


def progress(msg)
  msg = "#{Time.now.strftime('%Y.%m.%d %H:%M:%S:%L')} install_sw_medelexis: #{msg}"
  @@msgs ||= []
  @@msgs << msg
  puts msg
end

def create_snapshot(name, full = true)
  FileUtils.makedirs(RESULT_DIR, :verbose => true) unless File.directory?(RESULT_DIR)
  cmd = "scrot --silent --border #{RESULT_DIR}/#{name.gsub(/\W/,'_')}.png"
  if system(cmd)
    progress "created snapshot: #{cmd}"
  else
    progress "create_snapshot via #{cmd} failed"
  end
end

def get_window_name(name = 'Elexis [[:digit:]].[[:digit:]].[[:digit:]]')
  elexis_windows = `wmctrl -l | grep -e '#{name}'`
  if elexis_windows.size > 10
    elexis_windows.split(/\s+/)[-2..-1].join(' ')else
    nil
  end
end

def prepare_medelexis
  progress "preparing medelexis #{MEDELEXIS_EXE} for #{VARIANT.inspect}"
  # Output some debugging info
  system('env')
  system("echo 'I am' `whoami`: `id`")
  system("ls -l #{File.expand_path('~')}")
  unless (File.readable?(LICENSE_ORIGIN) || File.readable?(LICENSE_INSTALLED))
    puts "Either #{LICENSE_ORIGIN} or  #{LICENSE_INSTALLED} must be readable"
    exit 1
  end
  FileUtils.cp(LICENSE_ORIGIN, LICENSE_INSTALLED, :verbose => true) unless File.exist?(LICENSE_INSTALLED)
  unless  File.readable?(LICENSE_INSTALLED)
    puts "Could not read #{LICENSE_INSTALLED}"
    exit 1
  end
  progress "prepared #{LICENSE_INSTALLED} #{File.size(LICENSE_INSTALLED)}ng8"
  File.open(PASSWORD_FILE, 'w+') {|f| f.puts 'dummy_password_from_'+ File.basename(__FILE__) }
  progress "prepared #{PASSWORD_FILE}"
  FileUtils.makedirs(File.dirname(ACCEPTED_LICENSE))
  File.open(ACCEPTED_LICENSE, 'w+') {|f| f.puts %(eclipse.preferences.version=1
usageConditionAcceptanceDate=#{Time.now}
usageConditionAccepted=true
) }
  progress "prepared medelexis #{ACCEPTED_LICENSE}"
end

def start_medelexis
  progress "Starting #{MEDELEXIS_EXE} for #{VARIANT.inspect}. pid #{Process.pid}"
  unless get_window_name
    @medelexis_script
    Dir.chdir(File.dirname(MEDELEXIS_EXE))
    cmd = "./#{File.basename(MEDELEXIS_EXE)} -nl de_CH -clean -eclipse-password #{PASSWORD_FILE} " +
      '-vmargs -Declipse.p2.unsignedPolicy=allow ' +
      '-Dch.elexis.username=007 -Dch.elexis.password=topsecret -Delexis-run-mode=RunFromScratch ' +
      "-Dprovisioning.UpdateRepository=#{VARIANT}"
    progress cmd
    pid = Process.spawn cmd
    $sw_errors = 0
    while true
      sleep 1
      $sw_errors += 1
      name=get_window_name
      break if name
      if $sw_errors >= 120
        progress "Failed starting Elexis after 120 seconds"
        exit 3
      end
    end
    send_escape_to_window('InfoBox')
    progress "Waiting for Medelexis to be fully active"
    sleep 5
    send_escape_to_window('InfoBox')
    progress "Medelexis full name is '#{name}' after #{$sw_errors} seconds"
    send_escape_to_window('InfoBox')
  end
end

def send_escape_to_window(windowname)
  err_name=get_window_name(windowname)
  return unless err_name
  if err_name
    $sw_errors += 1
    create_snapshot("#{$sw_errors}_#{err_name}")
    cmd = "xdotool search --name #{windowname} windowactivate && xdotool key Escape"
    res = system(cmd)
    progress "Found error_window #{$sw_errors} rm res #{res} for #{cmd}"
  end
end

def install_sw
  send_escape_to_window('InfoBox')
  progress "Installing SW #{get_window_name}  after #{(Time.now - StartTime).to_i} seconds"
  system("wmctrl -c '#{get_window_name}'")
  sleep 5
  create_snapshot('install_sw_pressed_quit')
  progress "Waiting for Elexis to quit"
  while name = get_window_name
    sleep 10
    progress "Elexis #{name} still alive"
    PROBLEMATIC_WINDOW_TITLES.each{ |name| send_escape_to_window(name) }
  end
end

prepare_medelexis
if File.exist?(FLAG_FILE)
  puts "File #{FLAG_FILE} exists. Skip"
  exit 0
elsif !File.executable?(MEDELEXIS_EXE)
  puts "No Medelexis executable  found at #{MEDELEXIS_EXE}. Skip"
  exit 1
end

begin
  StartTime = Time.now
  create_snapshot("install_sw_start", true)
  start_medelexis
  create_snapshot('install_sw_before')
  install_sw
ensure
  create_snapshot("install_sw_done", true)
  diff = (Time.now - StartTime).to_i
  progress("done #{diff} seconds")
end
File.open(FLAG_FILE, 'w+' ) {|f| f.puts @@msgs.join("\n") }
puts @@msgs.join("\n")

