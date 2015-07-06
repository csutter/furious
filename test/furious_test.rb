require 'test_helper'

class FuriousTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Furious::VERSION
  end
end
