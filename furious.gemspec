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

  spec.add_dependency 'typhoeus', '~> 0.7'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.7'
  spec.add_development_dependency 'minitest-reporters', '~> 1.0'
  spec.add_development_dependency 'mocha', '~> 1.1'
  spec.add_development_dependency 'webmock', '~> 1.21'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'fakefs', '~> 0.6'
end
