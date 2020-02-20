lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "has_email_authentication/version"

Gem::Specification.new do |spec|
  spec.name                  = "has_email_authentication"
  spec.version               = HasEmailAuthentication::VERSION
  spec.authors               = ["Michael van Rooijen"]
  spec.email                 = ["michael@vanrooijen.io"]
  spec.summary               = "The email equivalent of has_secure_password for ActiveRecord."
  spec.homepage              = "https://github.com/mrrooijen/has_email_authentication"
  spec.license               = "MIT"
  spec.files                 = `git ls-files -z`.split("\x0")
  spec.executables           = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files            = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths         = ["lib"]
  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "activerecord", ">= 5.0.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "yard"
end
