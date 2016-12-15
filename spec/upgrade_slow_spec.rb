require 'db_helpers'
require 'upgrade_options'
require 'jubula_options'
require 'jubula_runner'
require 'upgrade_runner'

RSpec.describe "bin/tst_upgrade.rb real" do

  context 'when --definition=mysql_test --no-run-in-docker --clean and --info option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--definition=mysql_test", '--no-run-in-docker', '--clean', "--info"])
      @cli = UpgradeRunner.new
      # @cli.run(@options)
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
      expect(@cli_output).not_to be_nil
    end

    it "should drop the database" do
      check_drop_database(@cli_output)
    end

    it "should load the database" do
      expect(@cli_output).to match(LOAD_MYSQL_DB)
    end

    it "should save the database info" do
      expect(@cli_output).to match(/Stored info under /)
    end
  end

  context 'when --definition=postgres_test --no-run-in-docker --clean and --info option is given' do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(["--definition=postgres_test", '--no-run-in-docker', '--clean', "--info"])
      @cli = UpgradeRunner.new
      # @cli.run(@options)
      expect{  @cli_output = buildr_capture { @cli.run(@options)} }.not_to raise_error
      expect(@cli_output).not_to be_nil
    end

    it "should drop the database" do
      check_drop_database(@cli_output)
    end

    it "should load the database" do
      expect(@cli_output).to match(/Loading postgresql database /)
    end

    it "should save the database info" do
      expect(@cli_output).to match(/Stored info under /)
    end
  end
end