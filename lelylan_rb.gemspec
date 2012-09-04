# encoding: utf-8
require File.expand_path('../lib/lelylan/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'addressable', '~> 2.2'
  gem.add_dependency 'oauth2', '~> 0.8'
  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.8'
  gem.add_dependency 'hashie', '~> 1.2'
  gem.add_dependency 'multi_json', '~> 1.3'
  gem.authors = ["Andrea Reginato"]
  gem.description = %q{Ruby wrapper for Lelylan API}
  gem.email = ['touch@lelylan.com']
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/lelylan/lelylan-rb'
  gem.name = 'lelylan-rb'
  gem.platform = Gem::Platform::RUBY
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  gem.summary = gem.description
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = Lelylan::Version
end
