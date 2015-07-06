require 'test_helper'

module Furious
  class TagTest < Minitest::Test
    def test_new_fails_when_no_gemspec_given
      error = assert_raises(ArgumentError) do
        Package.new(nil)
      end
      assert_equal error.message, "No gemspec file given"
    end

    def test_tag_creates_git_tag
      tag = Tag.new('test/fixtures/dummy.gemspec')

      expectation = lambda { |command|
        assert_equal 'git tag v1.0 && git push origin v1.0', command
        0
      }

      tag.stub(:system, expectation) do
        tag.tag
      end
    end

    def test_tag_raises_on_failure
      tag = Tag.new('test/fixtures/dummy.gemspec')

      tag.stub(:system, 123) do
        error = assert_raises { tag.tag }
        assert_equal error.message, "Failed to tag v1.0"
      end
    end
  end
end