#!/usr/bin/env ruby
require 'db_helpers'
require 'upgrade_options'
require 'upgrade_runner'

{'VARIANT' => 'prerelease' , 'LICENSE_FILE' => 'test_minimal_license', 'DEFINITION' => 'rgw' }.each do |name, default|
  cmd = "#{name} = '#{ENV[name]}'.length > 0 ?  '#{ENV[name]}' : '#{default}'"
  eval cmd
end

# Here we test only using via the noop to see
RSpec.describe "bin/tst_upgrade.rb" do

  def check_drop_database(cli_output, clean= true)
    expect(cli_output).to match(/drop database test_elexis/) unless clean
    expect(cli_output).to match(/Successfully dropped/)
  end

  context "for #{VARIANT} #{DEFINITION} #{LICENSE_FILE}:" do
    before(:all) do
      cleanup_directories
      @options = UpgradeOptions.new(['--upgrade', '--clean', "--definition=#{DEFINITION}", "--license-file="+LICENSE_FILE, "--variant="+VARIANT, '--run-in-docker', "Screenshot"])
      puts @options.inspect
      expect(@options[:clean]).to eq true
      expect(@options[:upgrade]).to eq true
      expect(@options[:definition]).to eql DEFINITION
      expect(@options[:license_file]).to eql LICENSE_FILE
      expect(@options[:variant]).to eql VARIANT
      @cli = UpgradeRunner.new
      @result = @cli.run(@options)
    end

    it "should return true for the import script" do
      expect(@result).to eql true
    end

    it "should report good results" do
      expect(InstHelpers.report_result(@options)).to eql true
    end

    tests = [
      'give the time of upgrade of database',
      'give the time and number of installed features',
      'give the condensed review of imported database (size)',
      'give the time to load the database',
    ]
    tests.each do |test|
      it "#{test}" do
        skip "we don't test #{test}"
      end
    end if false
  end
end