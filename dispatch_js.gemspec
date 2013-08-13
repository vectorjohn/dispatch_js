$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dispatch_js/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dispatch_js"
  s.version     = DispatchJs::VERSION
  s.authors     = ["Adam Jahn"]
  s.email       = ["ajjahn@gmail.com"]
  s.homepage    = "https://github.com/ajjahn/dispatch_js"
  s.summary     = "DispatchJs is a tiny Rails engine that sets up DOM-based Routing."
  s.description = "DispatchJs is a tiny Rails engine that sets up DOM-based Routing."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"

  s.add_development_dependency "sqlite3"
end
