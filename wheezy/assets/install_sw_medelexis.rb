#!/usr/bin/env ruby
# Copyright (c) Niklaus Giger, 2016
# License EPL v1.0
# Needs the following debian packages: x11-apps imagemagick xdotool scrot
# On windows we could use http://www.nirsoft.net/utils/nircmd.html
#   nircmd.exe cmdwait 2000 savescreenshot "f:\temp\shot.png" Wait 2 seconds, and then save the current screen to shot.png
#   Close all your Internet Explorer windows  nircmd.exe win close class "IEFrame"
#   Answer 'Yes' to a standard Windows message-box.   nircmd.exe dlg "" "" click yes
require 'fileutils'

ELEXIS_DB_DEFAULTS = '-Dch.elexis.username=007 -Dch.elexis.password=topsecret -Delexis-run-mode=RunFromScratch '

if ARGV.size < 3
  puts "Expecting at three arguments: MEDELEXIS_EXE VARIANT RESULT_DIR [ELEXIS_DB_PARAMS]"
  puts "ELEXIS_DB_PARAMS default to #{ELEXIS_DB_DEFAULTS}"
  exit 3
end
MEDELEXIS_EXE = ARGV[0]
VARIANT=ARGV[1]
ELEXIS_DB_PARAMS = ARGV.size > 3 ? ARGV[3] : ELEXIS_DB_DEFAULTS
RESULT_DIR = File.expand_path(ARGV[2])
MAX_WAIT = 120
FLAG_FILE = File.join(RESULT_DIR, File.basename(__FILE__, '.rb') + '.done')
ERROR_FILE = File.join(RESULT_DIR, File.basename(__FILE__, '.rb') + '.errors')
PASSWORD_FILE = File.expand_path('~') + '/.medelexis.dummy.password'
ACCEPTED_LICENSE  =  File.dirname(MEDELEXIS_EXE)+ '/configuration/.settings/MedelexisDesk.prefs'
LICENSE_ORIGIN    =  File.expand_path('~') +'/medelexis_jubula_license.xml'
LICENSE_INSTALLED =  File.expand_path('~') +'/elexis/license.xml'
ERROR_WINDOW  = 'Problem Occurred'  # eg. 'Additional p2 locations' has encounter a problem
$sw_errors = 0

NEEDED_APPS = [ 'xdotool', 'scrot', 'wmctrl']
PROBLEMATIC_WINDOW_TITLES = [
  'InfoBox not proper private key', # eg. priaid
  'Install',
  'Update', # Update Error prerelease -> altes release updaten
  ERROR_WINDOW,
  'Multiple problems have occurred', # eg. Several Installing
]

NEEDED_APPS.each do | tool|
  unless system("which #{tool}")
    puts "Missing tool  #{tool}"
    exit 2
  end
end

def progress(msg, error = false)
  msg = "#{Time.now.strftime('%Y.%m.%d %H:%M:%S:%L')} install_sw_medelexis: #{msg}"
  @@msgs ||= []
  @@msgs << msg
  puts msg
end

def report_error
  File.open(ERROR_FILE, 'w+' ) { |f| f.puts("Handled #{$sw_errors.to_s} error") }
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
  if $VERBOSE
    system('env')
    system("echo 'I am' `whoami`: `id`")
    system("ls -l #{File.expand_path('~')}")
  end
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
      ELEXIS_DB_PARAMS + ' ' + "-Dprovisioning.UpdateRepository=#{VARIANT}"
    progress cmd
    pid = Process.spawn cmd
    Thread.new do
      Process.wait(pid)
      res = $?.clone
      puts "Thread: Medelexis pid #{pid} finished with #{res.exitstatus}"
    end
    count = 0
    while true
      sleep 1
      count += 1
      puts "Medelexis running #{count} pid #{pid}" if $VERBOSE
      name=get_window_name
      break if name
      if count >= 120
        progress "Failed starting Elexis after 120 errors"
        report_error
        exit 3
      end

      fail "#{MEDELEXIS_EXE} died. Why?" unless Process.getpgid( pid )
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
  if wichtig = get_window_name("Wichtige Reminder")
    send_escape_to_window("Wichtige") # Sending "Wichtige Reminder" will fail
    sleep 0.5
  end
  system("wmctrl -c '#{get_window_name}'")
  sleep 5
  create_snapshot('install_sw_pressed_quit')
  progress "Waiting for Elexis to quit"
  while name = get_window_name
    sleep 3
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
  create_snapshot("install_finished", true)
  diff = (Time.now - StartTime).to_i
  progress("done #{diff} seconds")
end
File.open(FLAG_FILE, 'w+' ) {|f| f.puts @@msgs.join("\n") }
report_error
puts @@msgs.join("\n")

