# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dkv/version'

Gem::Specification.new do |spec|
  spec.name          = "dkv"
  spec.version       = DKV::VERSION
  spec.authors       = ["Darcy Laycock"]
  spec.email         = ["sutto@sutto.net"]

  spec.summary       = %q{A simple dynamodb-based key value command line client.}
  spec.description   = %q{A simple dynamodb-based key value command line client.}
  spec.homepage      = "https://github.com/sutto/gkv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'aws-sdk', '~> 2.0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
