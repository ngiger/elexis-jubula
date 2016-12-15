require 'db_helpers'
require 'jubula_options'
require 'jubula_runner'

# Here we test only using via the noop to see
RSpec.describe "bin/jubularunner.rb" do

  context 'when --noop and Screenshot option is given' do
    before(:all) do
      cleanup_directories
      @options = JubulaOptions.new(["--noop", "Screenshot"])
      expect(@options[:noop]).to eq true
      expect(@options[:run_in_docker]).to eq false
      @cli = JubulaRunner.new
      expect{  @cli_output = buildr_capture { @cli.run(@options,  ['Screenshot']) } }.not_to raise_error
      @cli.run(@options, ['Screenshot']) unless @cli_output
    end

    it "should call maven" do
      expect(@cli_output).to match(/mvn clean integration-test/)
    end
  end

  context 'when --noop, --run-in-docker and Screenshot option is given' do
    before(:all) do
      cleanup_directories
      @options = JubulaOptions.new(["--noop", '--run-in-docker', "Screenshot"])
      expect(@options[:noop]).to eq true
      expect(@options[:run_in_docker]).to eq true
      @cli = JubulaRunner.new
      expect{  @cli_output = buildr_capture { @cli.run(@options,  ['Screenshot']) } }.not_to raise_error
      @cli.run(@options, ['Screenshot']) unless @cli_output
    end

    it "should call maven" do
      expect(@cli_output).to match(/mvn clean integration-test/)
    end

    it "should stop the docker" do
      expect(@cli_output).to match(/docker-compose.* --project-name jubula.*\s+stop/)
    end

    it "should remove the docker" do
      expect(@cli_output).to match(/docker-compose.* --project-name jubula.*\s+rm/)
    end
  end

  context 'when --noop --medelexis and Screenshot option is given' do
    before(:all) do
      cleanup_directories
      startTime = Time.now
      @options = JubulaOptions.new(["--noop", '--medelexis', 'Screenshot'])
      expect(@options[:noop]).to eq true
      expect(@options[:run_in_docker]).to eq false
      expect(@options[:medelexis]).to eq true
      @cli = JubulaRunner.new
      now = Time.now
      expect{  @cli_output = buildr_capture { @cli.run(@options,  ['Screenshot']) } }.not_to raise_error
      @cli.run(@options, ['Screenshot']) unless @cli_output
      expect(now - startTime).to be < 5.0 # Why it is around 1.8 seconds?
    end

    it "should copy the elexis.license" do
      expect(@cli_output).to match(/cp.*medelexis_jubula_license.xml/)
    end
    it "should call maven for Screenshot" do
      expect(@cli_output).to match(/mvn clean integration-test -Dtest_to_run=Screenshot/)
    end
  end
end