#!/usr/bin/env ruby
require 'fileutils'
require 'timeout'
@nr_okay = 0
@nr_failed = 0
MAX_WAIT = 120

def report(msg = "#{@nr_okay + @nr_failed}: Had #{@nr_okay} sucesses and #{@nr_failed} failures")
  msg = "#{Time.now}: #{msg}"
  puts msg
  File.open('local_test_loop.log', 'a+') {|f| f.puts msg}
end

while true
  system('killall Elexis3')
  system('/opt/jubula_8.2.0.021/server/autagent -stop -p 6333')
  system('/opt/jubula_8.2.0.021/server/autagent -l -p 6333 &')
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
