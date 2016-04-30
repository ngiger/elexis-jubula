#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'common'

director_zip = Config[:director_latest]

elexis_zip = Config[:elexis_fsf][VARIANT][:full_zip_url]

if macos?
  elexis_zip.sub!('linux.gtk.x86_64', 'macosx.cocoa.x86_64')
  director_zip.sub!('linux.gtk.x86_64', 'macosx.cocoa.x86_64')
end

INSTALL_FROM_JENKINS = true
if INSTALL_FROM_JENKINS # install from jenkins
  download_and_unzip(elexis_zip.gsub('snapshot', VARIANT), File.join(WorkDir, '**/plugins'))
else # install via director
  download_and_unzip(director_zip, File.join(WorkDir, 'director'))
  to_install = Config[:elexis_fsf][:features_2_install]
  cmd = "#{WorkDir}/director/director \
    -profile Elexis \
    -d #{WorkDir} \
    -repository #{to_install.keys.join(',')} -installIUs #{to_install.values.join(' -i ')}
  "
  unless Dir.glob('*lexis*.ini').size > 0
    puts "Calling director with #{cmd}"
    exit 2 unless system(cmd)
  end
end

if macos?
  config_ini = Dir.glob('**/*app/configuration/config.ini')
  name = config_ini[0].sub('/configuration/config.ini', '').sub('.app', '')
  Elexis = File.join(config_ini[0].sub('/configuration/config.ini', ''), 'Contents', 'MacOS', name)
  inst_dir = File.expand_path(File.dirname(File.dirname(config_ini[0])))
else
  config_ini = Dir.glob('**/configuration/config.ini')
  candidates = Dir.glob(File.dirname(config_ini[0]) + '/../*.ini')
  Elexis = File.expand_path(candidates.first.sub('.ini', ''))
  inst_dir = File.dirname(Elexis)
end
puts "elexis seems to be installed as #{File.basename(Elexis)} in #{inst_dir} "
unless File.executable?(Elexis)
  puts "elexis: #{Elexis} is not executable. Why?"
  exit 3
end
install_rcp_support_for_jubula(inst_dir)
patch_ini_file_for_jubula_rc(inst_dir)
prepare_medelexis(inst_dir)

puts "Done with #{File.basename(__FILE__)}"
