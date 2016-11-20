# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motion-json-api/version'

Gem::Specification.new do |spec|
  spec.name          = "motion-json-api"
  spec.version       = MotionJsonApi::VERSION
  spec.authors       = ["Joffrey Jaffeux"]
  spec.email         = ["j.jaffeux@gmail.com"]

  spec.summary       = %q{Simplified JSONApi client for RubyMotion iOS apps.}
  spec.description   = %q{A small library that helps you transform JSONApi server responses into objects.}
  spec.homepage      = "https://github.com/jjaffeux/motion-json-api"
  spec.license       = "MIT"

  spec.files = Dir.glob("lib/**/*", File::FNM_DOTMATCH) + %w(LICENSE.txt README.md)
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.9'
end
