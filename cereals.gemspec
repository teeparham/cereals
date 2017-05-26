require "./lib/cereals/version"

Gem::Specification.new do |spec|
  spec.name          = "cereals"
  spec.version       = Cereals::VERSION
  spec.authors       = ["Tee Parham"]
  spec.email         = ["tee@neighborland.com"]

  spec.summary       = "JSON serializer classes"
  spec.description   = "JSON serializer classes"
  spec.homepage      = "https://github/com/teeparham/cereals"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
