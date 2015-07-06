require 'test_helper'

module Furious
  class TagTest < Minitest::Test
    def test_new_fails_when_no_gemspec_given
      error = assert_raises(ArgumentError) do
        Tag.new(nil)
      end
      assert_equal error.message, 'No gemspec file given'
    end

    def test_tag_creates_git_tag
      subject.expects(:system).with('git tag v1.0 && git push origin v1.0').returns(true)
      subject.tag
    end

    def test_tag_raises_on_failure
      subject.stub(:system, false) do
        error = assert_raises { subject.tag }
        assert_equal error.message, 'Failed to tag v1.0'
      end
    end

    private

    def subject
      @subject ||= Tag.new('test/fixtures/dummy.gemspec')
    end
  end
end
