require 'test_helper'

module Furious
  class PackageTest < Minitest::Test
    def setup
      # Silence Rubygems - comment this out to debug if #test_build_builds_gem fails
      Gem::DefaultUserInteraction.ui = Gem::SilentUI.new
    end

    def test_new_fails_when_no_gemspec_given
      error = assert_raises(ArgumentError) do
        Package.new(nil)
      end
      assert_equal error.message, "No gemspec file given"
    end

    def test_build_builds_gem
      package = Package.new('test/fixtures/dummy.gemspec')

      FakeFS do
        package.build
        assert File.exist?('dummy-1.0.gem'), 'Gem package was not generated'
      end
    end
  end
end
