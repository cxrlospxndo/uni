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
  spec.description   = %q{Permite consultar informacion publica(nombre, facultad, foto, etc) y privada(cursos y notas) de un alumno}
  # spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_dependency "mechanize"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
