require 'test_helper'

module Furious
  class PushTest < Minitest::Test
    def setup
      ENV['GEMFURY_TOKEN'] = 'deadbeef'
      ENV['GEMFURY_ACCOUNT'] = 'account'

      WebMock.disable_net_connect!
    end

    def test_new_fails_when_no_gemspec_given
      error = assert_raises(ArgumentError) do
        Push.new(nil)
      end
      assert_equal error.message, 'No gemspec file given'
    end

    def test_push_fails_without_env_token
      ENV['GEMFURY_TOKEN'] = nil

      error = assert_raises { subject.push }
      assert_equal error.message, 'No GEMFURY_TOKEN specified in environment'
    end

    def test_push_fails_without_env_account
      ENV['GEMFURY_ACCOUNT'] = nil

      error = assert_raises { subject.push }
      assert_equal error.message, 'No GEMFURY_ACCOUNT specified in environment'
    end

    def test_push_pushes_to_gemfury
      stub_request(:post, 'https://push.fury.io/deadbeef/account/')
        .with { |request| request.body.include?('package=') }
        .to_return(status: 200)

      subject # Initialize subject outside of FakeFS block
      FakeFS do
        File.write('dummy-1.0.gem', "I'M A GEM")
        subject.push
      end
    end

    private

    def subject
      @subject ||= Push.new('test/fixtures/dummy.gemspec')
    end
  end
end
