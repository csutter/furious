module Furious
  class Job
    attr_reader :file, :spec

    def initialize(file)
      fail ArgumentError, 'No gemspec file given' if file.nil?

      @file = file
      @spec = Gem::Specification.load(file)
    end
  end
end
