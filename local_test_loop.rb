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
  File.open('local_test_loop.log', 'a+') {|f| f.puts msg}
end

if is_macos
  aut_agent = '/Applications/jubula_8.2.0.021/server/autagent.app/Contents/MacOS/autagent'
  ENV['aut_exe'] = Dir.pwd + 'work/Elexis3.app/Contents/MacOS/Elexis3'
else
  aut_agent = '/opt/jubula_8.2.0.021/server/autagent'
end

while true
  system('killall Elexis3', MAY_FAIL) unless is_macos
  system("#{aut_agent} -stop -p 6333", MAY_FAIL)
  system("#{aut_agent} -l -p 6333 &", MAY_FAIL)
  report
  break if (@nr_okay + @nr_failed) > 100
  begin
    timeout(MAX_WAIT) do
    result = system('mvn clean integration-test -Dtest=ch.ngiger.jubula.testsuites.Screenshot --offline')
    result ? @nr_okay+=1 : @nr_failed += 1
  end
  rescue Timeout::Error
    report "Got timeout after #{MAX_WAIT} seconds"
    @nr_failed += 1
    FileUtils.cp('results/AUT_run.log', 'results/AUT_run.failed_' + @nr_failed.to_s, :verbose =>true)
  end
end
