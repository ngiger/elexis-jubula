#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'

download_and_unzip(Config[:elexis_fsf][:full_zip_url], File.join(WorkDir, 'plugins'))
download_and_unzip(Config[:director_latest], File.join(WorkDir, 'director'))

to_install = Config[:elexis_fsf][:features_2_install]
cmd = "#{WorkDir}/director/director \
  -profile Elexis \
  -d #{WorkDir} \
  -repository #{to_install.keys.join(',')} -installIUs #{to_install.values.join(' -i ')}
"
unless (elexis = Dir.glob('*lexis*.ini')).size > 0
  puts "Calling director with #{cmd}"
  exit 2 unless system(cmd)
end
Elexis = elexis[0].sub('.ini', '')
puts "elexis seems to be installed as #{Elexis}"
