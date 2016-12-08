#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)), 'lib')
require 'common'

def install_opensource_elexis(noop = ENV['DRY_RUN'], variant = VARIANT)
  director_zip = Config[:director_latest]
  elexis_zip = Config[:elexis_fsf][variant][:full_zip_url]

  if macos?
    elexis_zip.sub!('linux.gtk.x86_64', 'macosx.cocoa.x86_64')
    director_zip.sub!('linux.gtk.x86_64', 'macosx.cocoa.x86_64')
  end

  if true # install from jenkins
    download_and_unzip(elexis_zip.gsub('snapshot', variant), File.join(WorkDir, '**/plugins'))
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
    elexis = File.join(config_ini[0].sub('/configuration/config.ini', ''), 'Contents', 'MacOS', name)
    inst_dir = File.expand_path(File.dirname(File.dirname(config_ini[0])))
  else
    config_ini = Dir.glob('**/configuration/config.ini')
    if config_ini.size == 0
      puts "Cannot show commands to install RCP-Support and patch if no config.ini found"
      candidates = [File.join(Dir.pwd, 'work/Elexis')]
    else
      candidates = Dir.glob(File.dirname(config_ini[0]) + '/../*.ini')
    end
    elexis = File.expand_path(candidates.first.sub('.ini', ''))
    inst_dir = File.dirname(elexis)
  end
  puts "elexis seems to be installed as #{File.basename(elexis)} in #{inst_dir} "
  unless File.executable?(elexis)
    puts "elexis: #{elexis} is not executable. Why?"
    exit 3
  end
  install_rcp_support_for_jubula(inst_dir)
  patch_ini_file_for_jubula_rc(inst_dir)
  prepare_medelexis(inst_dir)

  puts "Done with #{File.basename(__FILE__)}"
end

if $0.eql?(__FILE__)
  install_opensource_elexis
end