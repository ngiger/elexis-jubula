require 'db_helpers'
require 'upgrade_options'
require 'upgrade_runner'

# Here we test only using via the noop to see
RSpec.describe "upgrade" do

  def check_drop_database(cli_output)
    expect(cli_output).to match(/drop database test_elexis/)
    expect(cli_output).to match(/Successfully dropped/)
  end

  context 'when --noop and --drop option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", "--drop"])
      expect(@options[:noop]).to eq true
      @cli = UpgradeRunner.new
      @cli_output = buildr_capture { @cli.run(@options)}
    end
    it "should handle the noop option" do
      check_drop_database(@cli_output)
    end

  end

  context 'when --noop and --clean option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", "--clean"])
      expect(@options[:noop]).to eq true
      @cli = UpgradeRunner.new
      @cli_output = buildr_capture { @cli.run(@options)}
    end

    it "should drop the database" do
      check_drop_database(@cli_output)
    end

    it "should clean results directory" do
      expect(@cli_output).to match(/Removing/)
    end
    it "should load the database" do
      expect(@cli_output).to match(/Loading database/)
    end
  end
  context 'when --noop and --upgrade option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", "--upgrade"])
      expect(@options[:noop]).to eq true
      @cli = UpgradeRunner.new
      @cli_output = buildr_capture { @cli.run(@options)}
    end

    it "should download the from correct URL" do
      expect(@cli_output).to match(/wget.*medelexis\.ch.*prerelease.*ch.medelexis.application.product.Medelexis.*\.zip/)
    end

    it "should unzip the correct exefile" do
      expect(@cli_output).to match(/unzip.*prerelease.*Medelexis.*\.zip/)
    end

    it "should call the installer for the first installation without parameter" do
      expect(@cli_output).to match(/install_sw_medelexis.rb.* prerelease results-prerelease-1$/)
    end

    it "should load the database" do
      expect(@cli_output).to match(/Loading database /)
    end

    it "should call the installer for the second installation with parameter" do
      expect(@cli_output).to match(/install_sw_medelexis.rb.* prerelease results-prerelease-2.*-Dch.elexis.username=elexis/)
    end

    it "should save the database info" do
      expect(@cli_output).to match(/save various database info for: mysql rgw/)
    end
  end
  context 'when --noop, --clean and --info option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--noop", '--clean', "--info"])
      expect(@options[:noop]).to eq true
      @cli = UpgradeRunner.new
      @cli_output = buildr_capture { @cli.run(@options)}
    end

    it "should drop the database" do
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