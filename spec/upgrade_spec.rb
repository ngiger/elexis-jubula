require 'db_helpers'
require 'upgrade_options'
require 'jubula_options'
require 'jubula_runner'
require 'upgrade_runner'

# Here we test only using via the noop to see
RSpec.describe "bin/tst_upgrade.rb" do

  def check_drop_database(cli_output, clean= true)
    expect(cli_output).to match(/drop database test_elexis/) unless clean
    expect(cli_output).to match(/Successfully dropped/)
  end

  context 'when --noop, --run-in-docker and Screenshot option is given' do
    before(:all) do
      cleanup_directories
      @options = JubulaOptions.new(["--noop", '--run-in-docker', "Screenshot"])
      expect(@options[:noop]).to eq true
      @cli = JubulaRunner.new
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
    end

    it "should stop the docker" do
      expect(@cli_output).to match(/docker-compose.* --project-name jubula.*\s+stop/)
    end

    it "should remove the docker" do
      expect(@cli_output).to match(/docker-compose.* --project-name jubula.*\s+rm/)
    end
  end

  context 'when drop option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", "--drop"])
      @cli = UpgradeRunner.new
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
      @cli_output = buildr_capture { @cli.run(@options)} unless  @cli_output
    end
    it "should handle the noop option" do
      check_drop_database(@cli_output,  @options[:noop])
    end
  end

  context 'when --noop and --clean option is given' do
    before(:each) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", "--clean"])
      puts @options.inspect
      expect(@options[:clean]).to eq true
      @cli = UpgradeRunner.new
      # @cli.run(@options)
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
    end

    it "should drop the database" do
      skip 'No time to mock drop when noop'
      check_drop_database(@cli_output,  @options[:noop])
    end

    it "should clean results directory" do
      expect(@cli_output).to match(/Removing/)
    end

  end
  context 'when --noop and --upgrade option is given' do
    before(:each) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", "--upgrade", '--no-run-in-docker'])
      @cli = UpgradeRunner.new
      # @cli.run(@options)
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
    end

    it "should download the zip from correct URL" do
      expect(@cli_output).to match(/wget.*medelexis\.ch.*prerelease.*ch.medelexis.application.product.Medelexis.*\.zip/)
    end

    it "should unzip the correct exefile" do
      expect(@cli_output).to match(/unzip.*prerelease.*Medelexis.*\.zip/)
    end

    it "should call the installer for the first installation without parameter" do
      expect(@cli_output).to match(/install_sw_medelexis.rb.* prerelease results_prerelease\/runFromScratch$/)
    end

    it "should load the database" do
      expect(@cli_output).to match(/Loading database /)
    end

    it "should call the installer for the second installation with parameter" do
      expect(@cli_output).to match(/install_sw_medelexis.rb.* prerelease results_prerelease\/test_elexis.*-Dch.elexis.username=elexis/)
    end

    it "should save the database info" do
      expect(@cli_output).to match(/save various database info for: mysql rgw/)
    end

    it "should login as elexis user test" do
      expect(@cli_output).to match(/ch.elexis.username=elexis/)
      expect(@cli_output).to match(/-Dch.elexis.username=elexis/)
    end

  end
  context 'when --noop, --clean, --definition=rgw and --upgrade option is given' do
    before(:each) do
      cleanup_directories
      @options = UpgradeOptions.new(['--noop', '--clean', '--upgrade', '--no-run-in-docker', '--definition=rgw'])
      @cli = UpgradeRunner.new
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
    end

    it "should login as elexis user test" do
      expect(@cli_output).to match(/-Dch.elexis.username=test/)
      expect(@cli_output).to match(/-Dch.elexis.password=test/)
    end

  end
  context 'when --noop, --clean and --info option is given' do
    before(:each) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", '--clean', "--info"])
      @cli = UpgradeRunner.new
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
    end

    it "should drop the database" do
      skip 'No time to mock drop when noop'
      check_drop_database(@cli_output)
    end

    it "should load the database" do
      expect(@cli_output).to match(/Loading database /)
    end

    it "should save the database info" do
      expect(@cli_output).to match(/save various database info for: mysql rgw/)
    end
  end
end