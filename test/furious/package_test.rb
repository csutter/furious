require 'test_helper'

module Furious
  class PackageTest < Minitest::Test
    def test_fail_on_no_gemspec
      FakeFS.activate!
      assert_raises(GemspecMissingError) do
        Package.run
      end
      FakeFS.deactivate!
    end
  end
end
