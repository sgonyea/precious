# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "precious/version"

Gem::Specification.new do |s|
  s.name        = "precious"
  s.version     = Precious::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Scott Gonyea"]
  s.email       = ["me@sgonyea.com"]
  s.homepage    = "http://github.com/sgonyea/precious"
  s.summary     = %q{Precious helpers for your Bundler.}
  s.description = %q{PRECIOUS! SHINY!}

  s.add_development_dependency 'rspec', '~>2.6.0'
  s.add_development_dependency 'rr',    '~>1.0.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
