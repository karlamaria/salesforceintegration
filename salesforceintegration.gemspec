# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salesforceintegration/version'

Gem::Specification.new do |spec|
  spec.name          = "salesforceintegration"
  spec.version       = Salesforceintegration::VERSION
  spec.authors       = ["Karla Garcia"]
  spec.email         = ["karlamaria@gmail.com"]

  spec.summary       = %q{Salesforce Integration}
  spec.description   = %q{Lets you create a Lead in Salesforce using the gem Databasedotcom}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "active_support"
  spec.add_development_dependency "yaml"
  spec.add_development_dependency "databasedotcom"
end
