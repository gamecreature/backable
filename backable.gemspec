$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "backable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "backable"
  s.version     = Backable::VERSION
  s.authors     = ["Rick Blommers"]
  s.email       = ["rick@blommersit.nl"]
  s.homepage    = "https://github.com/gamecreature/backable"
  s.summary     = "A rails gem for simplifying back-buttons"
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3"
end
