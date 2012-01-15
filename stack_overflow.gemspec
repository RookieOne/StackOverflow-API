# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stack_overflow/version"

Gem::Specification.new do |s|
  s.name        = "stack_overflow"
  s.version     = API::StackOverflow::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonathan Birkholz"]
  s.email       = ["rookieone@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/stack_overflow"
  s.summary     = %q{HTTParty over the StackOverflow API}
  s.description = %q{HTTParty over the StackOverflow API}

  s.rubyforge_project = "stack_overflow"

  s.add_development_dependency "rspec"
  s.add_development_dependency "httparty"
  s.add_development_dependency "json"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
