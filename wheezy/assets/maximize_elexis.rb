#!/usr/bin/env ruby
puts "Screens before maximizing"
system("wmctrl -l -G")
name=`wmctrl -l | grep -i elexis`.split(/\s+/)[-2..-1].join(' ')
puts "Elexis full name is '#{name}'"
cmd = "wmctrl -r \"#{name}\" -e 1,0,0,1900,1280"
puts cmd
system(cmd)
puts "Screens after maximizing"
system("wmctrl -l -G")
