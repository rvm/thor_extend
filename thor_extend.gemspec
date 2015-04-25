# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thor_extend/version'

Gem::Specification.new do |spec|
  spec.name          = "ThorExtend"
  spec.version       = ThorExtend::VERSION
  spec.authors       = ["Jan Schulte"]
  spec.email         = ["hello@unexpected-co.de"]
  spec.license       = ["Apache-2.0"]

  spec.summary       = %q{Dynamically extend options on a Thor::Command}
  spec.homepage      = "https://github.com/rvm/thor_extend"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "thor"
end
