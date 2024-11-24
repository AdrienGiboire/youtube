# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtube/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube"
  spec.version       = Youtube::Version
  spec.authors       = ["Fabien G.", "Olivier de R.", "Louis C.", "Adrien G."]
  spec.email         = ["fabien@sent.com", "olivier.derobert@gmail.com", "louiscuny@gmail.com", "contact@adrien.sent.com"]
  spec.description   = %q{A Ruby interface to the Youtube API.}
  spec.summary       = spec.description
  spec.homepage      = "http://octoly.github.com/youtube/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', ['~> 2.12']
  spec.add_dependency 'multi_json', '~> 1.0'
  spec.add_dependency 'multi_xml'
  spec.add_dependency 'nokogiri', '> 1.15'
  spec.add_dependency 'iso8601'
  spec.add_development_dependency "bundler", "~> 2.5"
  spec.add_development_dependency "rake"
end
