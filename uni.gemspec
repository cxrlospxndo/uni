# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uni/version'

Gem::Specification.new do |spec|
  spec.name          = "uni"
  spec.version       = Uni::VERSION
  spec.authors       = ["Carlos Pando"]
  spec.email         = ["cxrlospxndo@gmail.com"]
  spec.summary       = %q{Libreria en Ruby para obtener informacion basica de la Orce-Uni}
  spec.description   = %q{Simpe interface de la orce, para consultar informacion publica y privada de un alumno}
  spec.homepage      = "http://cxrlospxndo.github.io/uni/"
  spec.license       = "MIT"

  spec.add_runtime_dependency "mechanize"
  spec.add_runtime_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
