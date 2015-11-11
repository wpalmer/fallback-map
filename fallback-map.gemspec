# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fallback-map}
  s.version = "1.0"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Will Palmer"]
  s.summary = %q{a hash for accessing multiple hashes}
  s.description = %q{A recursive map which allows multiple "fallback" hashes to be attached}
  s.email = ["wmpalmer@gmail.com"]
  s.homepage = %q{https://github.com/wpalmer/fallback-map-gem}
  s.require_paths = ["lib"]
  s.files = ["lib/fallback-map.rb"]
end
