require 'rubygems/package'

module Furious
  class Package < Job
    def build
      Gem::Package.build(spec)
    end
  end
end
