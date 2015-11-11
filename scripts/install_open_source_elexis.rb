#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'

download_and_unzip(Config[:elexis_fsf][:full_zip_url], File.join(WorkDir, 'plugins'))
download_and_unzip(Config[:director_latest], File.join(WorkDir, 'director'))

toInstall = Config[:elexis_fsf][:features_2_install]
cmd = "#{WorkDir}/director/director \
  -profile Elexis \
  -d #{WorkDir} \
  -repository #{toInstall.keys.join  (','   )} \
  -installIUs #{toInstall.values.join(' -i ')}
"
unless (elexis = Dir.glob("*lexis*.ini")).size > 0
  puts "Calling director with #{cmd}"
  exit 2 unless system(cmd)
end
Elexis = elexis[0].sub('.ini', '')
puts "elexis seems to be installed as #{Elexis}"
