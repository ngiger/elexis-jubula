#!/usr/bin/env ruby
require 'fileutils'
require 'timeout'
@nr_okay = 0
@nr_failed = 0

def report
  msg = "#{Time.now} #{@nr_okay + @nr_failed}: Had #{@nr_okay} sucesses and #{@nr_failed} failures"
  puts msg
  File.open('local_test_loop.log', 'a+') {|f| f.puts msg}
end

while true
  system('killall Elexis3')
  system('/opt/jubula_8.2.0.021/server/autagent -stop -p 6333')
  system('/opt/jubula_8.2.0.021/server/autagent -l -p 6333 &')
  report
  break if (@nr_okay + @nr_failed) > 50
  begin
    timeout(60) do
    result = system('mvn integration-test -Dtest=ch.ngiger.jubula.testsuites.Screenshot --offline')
    result ? @nr_okay+=1 : @nr_failed += 1
  end
  rescue Timeout::Error
    puts "#{Time.now}: Got timeout"
    @nr_failed += 1
  end
end
