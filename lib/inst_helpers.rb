require 'pp'
require 'fileutils'
require 'timeout'
require 'upgrade_options'

module InstHelpers
  def self.report_result(opts)
    pattern = "#{opts[:result_dir] ? opts[:result_dir] : Dir.pwd}/**/elexis-3.log"
    puts "report_result using #{pattern}"
    logs = Dir.glob(pattern)
    features = []
    logs.each do |log|
      puts "reading #{log}"
      IO.readlines(log).each do |line|
        m = /InstallFeaturesJob\s+-\s+(.+) -/.match(line)
        next unless m
        features << m[1]
      end
    end
    puts "Installed #{features.size} features: #{features.join(', ')}"
    msg = "Ran: "
    msg += "clean " if opts[:clean]
    msg += " definition " + opts[:definition] if opts[:definition]
    msg += " sql_dump " + opts[:sql_dump] if opts[:sql_dump]
    msg += " stored db info in " + opts[:db_info_root] if opts[:db_info_root]
    puts msg
  end
  def self.download(url, cache, noop = false)
    res = false
    saved = Dir.pwd
    FileUtils.makedirs(cache, :verbose => true, :noop => noop)
    Dir.chdir(cache) unless noop
    medelexis_yml = '/etc/medelexis.yml'
    unless File.exist?(medelexis_yml) && (access = YAML.load_file(medelexis_yml)) &&  access['medelexis_password'] && access['medelexis_user']
      puts "!!!!! medelexis_password and medelexis_user must be defined in the YAML file #{medelexis_yml} !!!!"
      puts "!!!!! Fatal error !!!!"
      exit 2
    end
    cmd = "wget --quiet --user #{access['medelexis_user']} --password #{access['medelexis_password']} --no-check-certificate -N --no-directories --cut-dirs=1 -m -r -np --convert-links #{url}"
    if File.exist?(File.basename(url))
      cmd = "curl --time-cond #{File.basename(url)}"
    else
      cmd = "curl"
    end
    cmd += " --insecure --silent --user #{access['medelexis_user']}:#{access['medelexis_password']} -O -L #{url}"
    unless res = system(cmd)
      puts "Unable to download #{url}"
    end
    system("pwd && ls -lrta")
  rescue => err
    puts "err #{err} #{err.backtrace.join("\n")}"
    res = false
  ensure
    Dir.chdir(saved)
    return res
  end

  def extract_medelexis_exe(variant, cache, dest)
    saved = Dir.pwd
    root      = 'https://sbe.medelexis.ch/jenkins/view/3.0/job'
    artifact  = 'lastSuccessfulBuild/artifact/ch.medelexis.application.p2site/target/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip'
    case variant
    when /master/
      jobname = 'Medelexis-3-Application'
    when /prerelase/
      jobname = 'Medelexis-3-Application-Releases'
    else # only support 3.0.25
      jobname = 'Medelexis-3-Application-Releases'
      artifact = '131/artifact/ch.medelexis.application.product/target/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip'
    end
    root      = 'https://download.medelexis.ch/medelexis.3.application'
    InstHelpers.download("#{root}/#{variant}/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip", cache, opts[:noop])
    FileUtils.makedirs(dest, :verbose => true, :noop => opts[:noop])
    Dir.chdir(dest) unless opts[:noop]
    puts File.expand_path(saved)
    candidates = Dir.glob("#{saved}/*elexis*.zip")+Dir.glob("#{cache}/*.zip")
    unless candidates.size > 0
      fail "Must find at least one zip file to unpack in #{saved} or #{cache}"
    end
    cmd = "unzip -qo #{candidates.first}"
    unless system(cmd)
      puts "Unable to unzip exe via #{cache} using #{cmd}"
      return false
    end
    true
  ensure
    Dir.chdir(saved)
    # https://sbe.medelexis.ch/jenkins/view/3.0/job/Medelexis-3-Application/lastSuccessfulBuild/artifact/ch.medelexis.application.p2site/target/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip
  end

  def prepare_license(container_home = false)
    dest = File.expand_path(File.join(Dir.home, 'elexis', 'license.xml'))
    license = opts[:license_file]
    puts "prepare_license run_in_docker? #{run_in_docker?} license #{license} dest #{dest}"
    if run_in_docker?
      puts "I am running inside the docker. The license file must already be present under #{dest} #{File.exist?(dest)}"
      raise "No license #{dest} found" unless File.exist?(dest)
      return File.exist?(dest)
    end
    if license
      unless File.exist?(license)
        puts "No license #{license} found"
        raise "No license #{license} found"
      end
      if container_home
        dest = File.expand_path(File.join(container_home, 'elexis', 'license.xml'))
      else
        dest = File.join(Dir.home, 'elexis', 'license.xml')
      end
      FileUtils.makedirs(File.dirname(dest), :verbose => true, :noop => opts[:noop]) unless File.exist?(File.dirname(dest))
      FileUtils.cp(license, dest, :verbose => true, :noop => opts[:noop])
      return system("ls -la #{dest}")
    end
  end
  def start_and_install_sw(dest, variant, result_dir, first_run)
    exefile = nil
    return unless opts[:medelexis]
    candidates = [ File.join(dest, 'Elexis3'),
      File.join(dest, 'Medelexis')]
    candidates.each do |exe| exefile = exe if File.executable?(exe) end
    if opts[:noop]
      exefile = "noop/Medelexis"
    elsif exefile # everything okay
    else
      puts "Could not find executable under #{candidates}"
      return false
    end
    puts "Executable is #{exefile}"
    FileUtils.makedirs(result_dir, :verbose => true, :noop => opts[:noop]) unless File.exist?(result_dir)
    elexis_log = File.expand_path("~/elexis/logs/elexis-3.log")
    FileUtils.rm_f(elexis_log, :verbose => true, :noop => opts[:noop]) if File.exist?(elexis_log)

    cmd = run_in_docker? ? '/app/install_sw_medelexis.rb' : 'wheezy/assets/install_sw_medelexis.rb'
    cmd += " #{exefile} #{variant} #{result_dir}"
    unless first_run
      cmd += " '#{opts[:db_elexis_params] }' "
    end
    res = true
    begin
      res = system(cmd)
      puts "first res #{res} for #{cmd}"
      ensure
        puts "ensure res #{res} for #{cmd}"
        FileUtils.cp(elexis_log, result_dir, :verbose => true, :noop => opts[:noop]) if File.exist?(elexis_log)
        FileUtils.cp(Dir.glob("#{dest}/workspace/.metadata/.log"), result_dir, :verbose => true, :noop => opts[:noop])
        unless res
          puts "Unable to to startup elexis using #{cmd}"
          return false
        end
    end
    return res
  end

  def upgrade
    variant = opts[:variant]
    cache = File.join(UpgradeOptions::CACHE_BASE, opts[:medelexis] ? 'medelexis' : 'elexis', variant)
    if opts[:medelexis]
      url = "https://download.medelexis.ch/medelexis.3/#{variant}"
      if File.exist?(File.join(WorkDir, 'plugins'))
        puts "Skip extract_medelexis_exe as #{cache}/plugins exists"
      else
        extract_medelexis_exe(variant, cache, WorkDir)
      end
    else
      puts "Installing Elexis opensource WorkDir is #{WorkDir} WorkDir #{WorkDir}"
      elexis_zip = Config[:elexis_fsf][variant][:full_zip_url]
      download_and_unzip(elexis_zip.gsub('master', variant), File.join(WorkDir, '**/plugins'))
      install_rcp_support_for_jubula(WorkDir)
      patch_ini_file_for_jubula_rc(WorkDir)
    end
    result_dir1 = "#{opts[:result_dir]}/runFromScratch"
    result_dir2 = "#{opts[:result_dir]}/#{opts[:db_name]}"
    result_dir3 = "#{opts[:result_dir]}/#{opts[:db_name]}_restart"

    res = true
    if File.exist?(result_dir1) && !opts[:clean]
      puts "upgrade: Skipping first install as we found #{result_dir1} and not clean demanded"
    else
      res = start_and_install_sw(WorkDir, variant, result_dir1, true)
      puts "upgrade: first start_and_install_sw returned #{res}"
      unless res
          puts "#{Time.now}: upgrade: first start_and_install_sw failed"
        return false
      end
    end
    puts "#{Time.now}: upgrade: start second start_and_install_sw"
    res = start_and_install_sw(WorkDir, variant, result_dir2, false)
    puts "#{Time.now}: upgrade: start second start_and_install_sw returned #{res}"
    res = start_and_install_sw(WorkDir, variant, result_dir3, false)
    puts "#{Time.now}: upgrade: start third start_and_install_sw returned #{res}"
    return res
  end

end
