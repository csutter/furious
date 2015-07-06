$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'furious'

require 'minitest/autorun'
require 'minitest/reporters'
require "mocha/mini_test"
require 'webmock/minitest'
require 'fakefs/safe'
require 'pry'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
