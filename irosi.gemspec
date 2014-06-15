# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'irosi/version'

Gem::Specification.new do |spec|
  spec.name          = "irosi"
  spec.version       = Irosi::VERSION
  spec.authors       = ["shiren1118"]
  spec.email         = ["shiren1118@126.com"]
  spec.summary       = "rosi image "
  spec.description   = "rosi image downloader"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
	
	spec.add_runtime_dependency 'curb'
	spec.add_runtime_dependency 'nokogiri'
end
