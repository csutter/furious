module Furious
  class Cli
    COMMANDS = {
      'package' => 'build a gem package',
      'tag' => 'tags the current gem version in the Git repository',
      'push' => 'pushes the gem to Gemfury (requires a package to be present, and GEMFURY_TOKEN/GEMFURY_ACCOUNT environment variables to be set)',
      'release' => 'combines `package`, `tag`, and `push`'
    }

    def initialize(argv)
      argv ||= []
      usage! unless argv.size == 1 && COMMANDS.include?(argv.first)

      @command = argv.first
    end

    def run
      send("run_#{@command}".to_sym)
    end

    private

    def run_package
      Package.new(gemspec_file).build
    end

    def run_tag
      Tag.new(gemspec_file).tag
    end

    def run_push
      Push.new(gemspec_file).push
    end

    def run_release
      run_package
      run_tag
      run_push
    end

    def gemspec_file
      @gemspec_file ||= Dir['*.gemspec'].first
    end

    def usage!
      $stderr.puts 'USAGE: furious <command>'
      COMMANDS.each do |cmd, desc|
        $stderr.puts "  #{cmd}: #{desc}"
      end
      Kernel.exit(1)
    end
  end
end
