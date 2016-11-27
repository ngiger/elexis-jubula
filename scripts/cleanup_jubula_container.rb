#!/usr/bin/env ruby
require 'pp'
require 'pry';

puts "Cleaning up unused Jubula containers"
containers = `docker images`.split("\n")
containers.each do |line|
  if /jubula_runner|_jenkinstest|<none>/i.match(line)
    name = line.split(/\s+/).first
    id = line.split(/\s+/)[2]
    if /jubula6\d\d\d_/.match(name)
      puts "Skipping #{name} id #{id}"
      next
    end
    puts line
    cmd = "docker rmi -f #{name}"
    puts "Calling #{cmd}"
    system(cmd)
  else
    puts "Skipping none jenkins #{line}"
  end
end
