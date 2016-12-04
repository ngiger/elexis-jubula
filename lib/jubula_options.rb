require 'trollop'

class JubulaOptions < Hash
  def initialize(options = ARGV)
    p = Trollop::Parser.new do
      version "JubulaRunner #{ElexisJubula::VERSION} (c) by Niklaus Giger <niklaus.giger@member.fsf.org>"
      banner <<-EOS
      #{version}
    Useage:
      * Run Jubula  GUI tests for Elexis
      * Run Elexis and/or Jubula AUT-agent inside the docker
      * Specify one or more tests to be run (unless autagent, build_docker or elexis given)
      * Parameters for each test are given in definitions/<testname>.yaml, overriding those from definitions/default.yaml
      * Results of each test are saved (with surefire reports) under results and results-<testname>
    EOS
      opt :noop,          "No-Operation. Show configuration and commands without executing them", :default => false
      opt :use_x11,       "Force to use your display when running. Patches wheezy/docker-compose.yml, too. Handy to debug problems."
      opt :build_docker,  "Build the docker image needed"
      opt :elexis,        "Run Elexis inside the docker"
      opt :aut_agent,     "Start autagent for Jubula inside the docker"
      opt :run_in_docker, "Run maven inside docker, not on the command line", :default => false
      opt :medelexis,     "Test Medelexis (not Elexis3) app", :default => false
      opt :variant,       "Possible values are snapshot, beta, prerelease, release", :type => String, :default => 'snapshot'
    end
    result = Trollop::with_standard_exception_handling p do
      p.parse options
    end
    ENV['DRY_RUN'] = 'true' if result[:noop]
    self.merge! result
  end
end