# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pepys/version'

Gem::Specification.new do |spec|
  spec.name          = "pepys"
  spec.version       = Pepys::VERSION
  spec.authors       = ["Caius Durling"]
  spec.email         = ["dev@caius.name"]

  spec.summary       = %{Logger that emits JSON}
  spec.description   = %{Inspired by node-bunyan, compatible with stdlib's Logger API}
  spec.homepage      = "https://github.com/caius/pepys"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
