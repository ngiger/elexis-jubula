#!/usr/bin/env ruby

files = Dir.glob("**/Elexis*.xml") + Dir.glob("**/*.java")
puts files
files.each do |file|
  inhalt = File.read(file)
  puts "#{file}: inhalt #{inhalt.size}"
  File.open(file, 'w+'){|f| f.write inhalt.gsub(/Elexis(([\dasr]|qualifier)*)_/, '') }
end
