# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "m0nkmaster_cucumber_salad"
  s.version = "0.0.3"
  s.authors = ["Rob MacDonald"]
  s.email = ["rob@robmacdonald.com"]
  s.description = "A gem to manage the usage of cucumber/mocking/multiple devices"
  
  s.files = Dir.glob("{features,lib,bin,config,vendor,.bundle}/**/*") +  %w(Gemfile)
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.6"
  s.summary = "Gem to ease the pain of managing capybara driver config and provide a home for common utils and patches"
  #s.files = `git ls-files`.split("\n")
  
  s.add_runtime_dependency("capybara", ["~>1.1.4"])
  s.add_runtime_dependency("cucumber", ["~=1.2.1"])
  s.add_runtime_dependency("rspec", [">=2.1.3"])
  s.add_runtime_dependency("poltergeist", ["~>1.0.2"])
  s.add_runtime_dependency("redis", ["~=3.0.2"])
end
