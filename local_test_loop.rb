#!/usr/bin/env ruby
require 'fileutils'
require 'timeout'
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'scripts')
require 'common'
@nr_okay = 0
@nr_failed = 0
MAX_WAIT = 120

def report(msg = "#{@nr_okay + @nr_failed}: Had #{@nr_okay} sucesses and #{@nr_failed} failures")
  msg = "#{Time.now}: #{msg}"
  puts msg
  File.open('local_test_loop.log', 'a+') { |f| f.puts msg }
end

ENV['aut_exe'] = Dir.pwd + 'work/Elexis3.app/Contents/MacOS/Elexis3' if macos?

while (@nr_okay + @nr_failed) < 100
  Kernel.system('pgrep -f Elexis3  | xargs kill') unless macos?
  Kernel.system('pgrep -f autagent | xargs kill') unless macos?
  report
  begin
    timeout(MAX_WAIT) do
      result = Kernel.system('mvn clean integration-test -Dtest=ch.ngiger.jubula.testsuites.Screenshot --offline')
      result ? @nr_okay += 1 : @nr_failed += 1
      Kernel.system('ls -l results/subdir/take_screenshot_active_window.png')
    end
  rescue Timeout::Error
    report "Got timeout after #{MAX_WAIT} seconds"
    @nr_failed += 1
    FileUtils.cp('results/AUT_run.log', 'results/AUT_run.failed_' + @nr_failed.to_s, verbose: true)
  end
end
