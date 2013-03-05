# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "cucumber_salad"
  s.version = "0.0.1"
  s.authors = ["Matthew Crouch"]
  s.email = ["Matthew.Crouch@bbc.co.uk"]
  s.description = "A gem to manage the usage of cucumber/mocking/multiple devices"
  
  s.files = Dir.glob("{features,lib,bin,config,vendor,.bundle}/**/*") +  %w(Gemfile Gemfile.lock)
  s.require_paths = ["lib"]
  s.rubygems_version = "1.3.6"
  s.summary = "Gem to ease the pain of managing capybara driver config and provide a home for common utils and patches"
  #s.files = `git ls-files`.split("\n")
  
  s.add_runtime_dependency("capybara", [">=2.0.2"])
  s.add_runtime_dependency("cucumber", [">=1.2.1"])
  s.add_runtime_dependency("rspec", [">=2.1.3"])
  s.add_runtime_dependency("poltergeist", [">=1.1.0"])
  s.add_runtime_dependency("redis", [">=3.0.2"])
end