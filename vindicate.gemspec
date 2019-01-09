$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "vindicate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vindicate"
  s.version     = Vindicate::VERSION
  s.authors     = ["stevensona"]
  s.email       = ["adamstevenson121@gmail.com"]
  s.homepage    = "https://github.com/stevensona/vindicate"
  s.summary     = "VIN Number validator for ActiveModel"
  s.description = "Provides VIN number validator for ActiveModel"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_runtime_dependency 'activemodel'

  s.add_development_dependency "rspec", '~> 3.7'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'rake'

end
