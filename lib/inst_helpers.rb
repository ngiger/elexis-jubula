require 'pp'
require 'fileutils'
require 'timeout'
require 'upgrade_options'

module InstHelpers
  def download(url, cache)
    res = false
    saved = Dir.pwd
    FileUtils.makedirs(File.dirname(cache), :verbose => true, :noop => opts[:noop])
    Dir.chdir(File.dirname(cache)) unless opts[:noop]
      Dir.chdir(File.dirname(cache)) unless opts[:noop]
      cmd = "wget --user #{ENV['medelexis_user']} --password #{ENV['medelexis_password']} -c -N --no-host-directories --cut-dirs=1 -m -r -np -k #{url}"
      unless res = system(cmd)
        puts "Unable to download #{url}"
        return false
      end
    ensure
      Dir.chdir(saved)
      return res
  end

  def install_variant(url, cache,  dest)
    puts "install_variant #{url} #{cache} #{dest}"
    ['plugins', 'features'].each do |to_install|
      FileUtils.makedirs(dest, :verbose => true, :noop => opts[:noop]) unless File.exist?(dest)
      FileUtils.cp_r(File.join(cache, to_install), dest, :preserve => true, :verbose => true, :noop => opts[:noop])
    end
  end

  def extract_medelexis_exe(variant, cache, dest)
    saved = Dir.pwd
    root      = 'https://sbe.medelexis.ch/jenkins/view/3.0/job'
    artifact  = 'lastSuccessfulBuild/artifact/ch.medelexis.application.p2site/target/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip'
    case variant
    when /snapshot/
      jobname = 'Medelexis-3-Application'
    when /beta/
      jobname = 'Medelexis-3-Application-Beta'
    when /prerelase/
      jobname = 'Medelexis-3-Application-Releases'
    else # only support 3.0.25
      jobname = 'Medelexis-3-Application-Releases'
      artifact = '131/artifact/ch.medelexis.application.product/target/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip'
    end
    # /home/srv/web/download.medelexis.ch/medelexis.3.application/snapshot/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip
    # download("#{root}/#{jobname}/#{artifact}", cache)
    root      = 'https://download.medelexis.ch/medelexis.3.application'
    download("#{root}/#{variant}/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip", cache)
    FileUtils.makedirs(dest, :verbose => true, :noop => opts[:noop])
    Dir.chdir(dest) unless opts[:noop]
    puts File.expand_path(saved)
    candidates = Dir.glob("#{saved}/*elexis*.zip")+Dir.glob("#{cache}/products/*.zip")
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

  def prepare_license
    license = opts[:license_file]
    if license
      unless File.exist?(license)
        puts "No file #{license} found"
        return false
      end
      dest = File.expand_path(File.join("~/elexis/license.xml"))
      puts dest
      FileUtils.makedirs(File.dirname(dest), :verbose => true, :noop => opts[:noop]) unless File.exist?(File.dirname(dest))
      FileUtils.cp(license, File.expand_path(File.join("~/elexis/license.xml")), :verbose => true, :noop => opts[:noop])
      return system("ls -la #{dest}")
    end
  end
  def start_and_install_sw(dest, variant, result_dir, first_run)
    exefile = nil
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

    cmd = "wheezy/assets/install_sw_medelexis.rb #{exefile} #{variant} #{result_dir}"
    unless first_run
      cmd += " '#{opts[:db_elexis_params] }' "
    end
    puts cmd
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
    if opts[:medelexis]
      prepare_license
    else
      puts "Download of elexis open source not yet supported, as there we have to join elexis-3-base and elexis-3-core"
    end unless run_in_docker?
    variant = opts[:variant]

    cache = File.join(UpgradeOptions::CACHE_BASE, opts[:medelexis] ? 'medelexis' : 'elexis', variant)
    url = "https://download.medelexis.ch/medelexis.3//#{variant}"
    dest = File.join(Dir.pwd, variant)
    result_dir1 = "results-#{variant}-1"
    result_dir2 = "results-#{variant}-2"

    if File.exist?(File.join(dest, 'plugins'))
      puts "Skip extract_medelexis_exe as #{cache}/plugins exists"
    else
      exe = extract_medelexis_exe(variant, cache, dest)
    end
    if false
      install_variant(url, cache, dest) unless Dir.glob("#{dest}/plugins/org.iatrix*.jar").size > 0
    else
      puts "Skip install_variant. We think it is better to instal"
    end
    res = true
    if File.exist?(result_dir1) && !opts[:clean]
      puts "Skipping first install as we found #{result_dir1} and not clean demanded"
    else
      res = start_and_install_sw(dest, variant, result_dir1, true)
      unless res
          puts "first start_and_install_sw failed"
        return false
      end
    end
    puts "start second start_and_install_sw"
    res = start_and_install_sw(dest, variant, result_dir2, false)
    puts "start second start_and_install_sw returned #{res}"
    return res
  end

end