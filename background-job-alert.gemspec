lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "background-job-alert/version"

Gem::Specification.new do |spec|
  spec.name        = "background-job-alert"
  spec.version     = BackgroundJobAlert::VERSION
  spec.summary     = "Background job alert"
  spec.description = "Background job alert"
  spec.authors     = ["manhbuithe"]
  spec.email       = "manhbui@remitano.com"
  spec.homepage    = ""
  spec.license     = "MIT"

  spec.files       = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rspec", "~> 3.11"
  spec.add_development_dependency "pry", "~> 0.14.1"
end
