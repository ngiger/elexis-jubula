require 'pp'
require 'fileutils'
require 'timeout'

module InstHelpers
  def self.download(url, cache)
    saved = Dir.pwd
    FileUtils.makedirs(File.dirname(cache))
    Dir.chdir(File.dirname(cache))
      Dir.chdir(File.dirname(cache))
      cmd = "wget --user #{ENV['medelexis_user']} --password #{ENV['medelexis_password']} -c -N --no-host-directories --cut-dirs=1 -m -r -np -k #{url}"
      puts cmd
      puts Dir.pwd
      fail "Unable to download #{url}" unless system(cmd)
    ensure
      Dir.chdir(saved)
  end

  def self.install_variant(url, cache,  dest)
    puts "install_variant #{url} #{cache} #{dest}"
    ['plugins', 'features'].each do |to_install|
      FileUtils.makedirs(dest, :verbose => true) unless File.exist?(dest)
      dir = File.join(dest, to_install)
      FileUtils.cp_r(File.join(cache, to_install), dest, :preserve => true, :verbose => true)
    end
  end

  def self.extract_medelexis_exe(variant, cache, dest)
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
    FileUtils.makedirs(dest)
    Dir.chdir(dest)
    cmd = "unzip -qo #{Dir.glob("#{cache}/products/*.zip").first}"
    fail "Unable to unzip exe via #{cache} using #{cmd}" unless system(cmd)
  ensure
    Dir.chdir(saved)
    # https://sbe.medelexis.ch/jenkins/view/3.0/job/Medelexis-3-Application/lastSuccessfulBuild/artifact/ch.medelexis.application.p2site/target/products/ch.medelexis.application.product.Medelexis-linux.gtk.x86_64.zip
  end

  def self.prepare_license
    license = OPTS[:license_file]
    if license
      fail "No file #{license} found" unless File.exist?(license)
      dest = File.expand_path(File.join("~/elexis/license.xml"))
      puts dest
      FileUtils.makedirs(File.dirname(dest), :verbose => true) unless File.exist?(File.dirname(dest))
      FileUtils.cp(license, File.expand_path(File.join("~/elexis/license.xml")), :verbose => true)
      system("ls -la #{dest}")
    end
  end
  def self.start_and_install_sw(dest, variant, result_dir, first_run)
    exefile = nil
    candidates = [ File.join(dest, 'Elexis3'),
      File.join(dest, 'Medelexis')]
    candidates.each do |exe| exefile = exe if File.executable?(exe) end
    fail "Could not find executable under #{candidates}" unless exefile
    puts "Executable is #{exefile}"
    puts Dir.pwd
    FileUtils.makedirs(result_dir) unless File.exist?(result_dir)
    elexis_log = File.expand_path("~/elexis/logs/elexis-3.log")
    FileUtils.rm_f(elexis_log) if File.exist?(elexis_log)

    cmd = "wheezy/assets/install_sw_medelexis.rb #{exefile} #{variant} #{result_dir}"
    unless first_run
      cmd += " '#{OPTS[:db_elexis_params] }' "
    end
    puts cmd
    res = true
    begin
      res = system(cmd)
      puts "first res #{res} for #{cmd}"
      ensure
        puts "ensure res #{res} for #{cmd}"
        FileUtils.cp(elexis_log, result_dir, :verbose => true) if File.exist?(elexis_log)
        FileUtils.cp(Dir.glob("#{dest}/workspace/.metadata/.log"), result_dir, :verbose => true)
        fail "Unable to to startup elexis using #{cmd}" unless res
    end
  end

  def self.upgrade
    if OPTS[:medelexis]
      prepare_license
    else
      puts "Download of elexis open source not yet supported, as there we have to join elexis-3-base and elexis-3-core"
    end
    variant = OPTS[:variant]

    cache = File.join(CACHE_BASE, OPTS[:medelexis] ? 'medelexis' : 'elexis', variant)
    url = "https://download.medelexis.ch/medelexis.3//#{variant}"
    dest = File.join(Dir.pwd, variant)

    extract_medelexis_exe(variant, cache, dest) unless File.exist?(File.join(dest, 'plugins'))
    install_variant(url, cache, dest) unless Dir.glob("#{dest}/plugins/org.iatrix*.jar").size > 0
    result_dir1 = "results-#{variant}-1"
    start_and_install_sw(dest, variant, result_dir1, true) unless File.exist?(result_dir1)
    result_dir2 = "results-#{variant}-2"
    start_and_install_sw(dest, variant, result_dir2, false)
  end

end