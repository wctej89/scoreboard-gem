# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scores/version'

Gem::Specification.new do |spec|
  spec.name          = "scores"
  spec.version       = Scores::VERSION
  spec.authors       = ["Tej Singh"]
  spec.email         = ["wctej89@gmail.com"]
  spec.description   = %q{Check sports scores from the terminal}
  spec.summary       = %q{Type scores and the league mlb, nba, nfl, nhl}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ["scores"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mechanize"
end
