require 'test_helper'

module Furious
  class CliTest < Minitest::Test
    def test_fails_without_arguments
      Kernel.expects(:exit).with(1)
      assert_output(nil, /USAGE/) do
        Cli.new(nil)
      end
    end

    def test_fails_with_empty_argument
      Kernel.expects(:exit).with(1)
      assert_output(nil, /USAGE/) do
        Cli.new([])
      end
    end

    def test_fails_with_invalid_argument
      Kernel.expects(:exit).with(1)
      assert_output(nil, /USAGE/) do
        Cli.new(['foobar'])
      end
    end

    def test_package_runs_correctly
      expect_mock_package
      Cli.new(['package']).run
    end

    def test_tag_runs_correctly
      expect_mock_tag
      Cli.new(['tag']).run
    end

    def test_push_runs_correctly
      expect_mock_push
      Cli.new(['push']).run
    end

    def test_release_runs_correctly
      expect_mock_package
      expect_mock_tag
      expect_mock_push
      Cli.new(['release']).run
    end

    private

    def expect_mock_package
      mock_package = mock('Package')
      mock_package.expects(:build)
      Package.expects(:new).returns(mock_package)
    end

    def expect_mock_tag
      mock_tag = mock('Tag')
      mock_tag.expects(:tag)
      Tag.expects(:new).returns(mock_tag)
    end

    def expect_mock_push
      mock_push = mock('Push')
      mock_push.expects(:push)
      Push.expects(:new).returns(mock_push)
    end
  end
end
