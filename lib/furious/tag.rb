require 'rubygems/package'

module Furious
  class Tag < Job
    def tag
      result = system("git tag #{tag_name} && git push origin #{tag_name}")
      raise "Failed to tag #{tag_name}" unless result.zero?
    end

    private

    def tag_name
      "v#{spec.version}"
    end
  end
end