# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'furious/version'

Gem::Specification.new do |spec|
  spec.name          = 'furious'
  spec.version       = Furious::VERSION
  spec.authors       = ['Christian Sutter']
  spec.email         = ['csutter@noreply.users.github.com']

  spec.summary       = 'Push gems to Gemfury, the simple way.'
  spec.description   = 'Packages and uploads gems to Gemfury without all the baggage of the official gem.'
  spec.homepage      = 'https://github.com/csutter/furious'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.executables  << 'furious'

  spec.add_dependency 'typhoeus'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'fakefs'
end
