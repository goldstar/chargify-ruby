
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chargify/version"

Gem::Specification.new do |spec|
  spec.name          = "chargify-ruby"
  spec.version       = Chargify::VERSION
  spec.authors       = ["Jared Hoyt"]
  spec.email         = ["jaredhoyt@gmail.com"]

  spec.summary       = %q{Chargify API wrapper}
  spec.description   = %q{Chargify API wrapper}
  spec.homepage      = "https://github.com/goldstar/chargify-ruby"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "artisanal-model"
  spec.add_runtime_dependency "dry-configurable", "~> 0.11"
  spec.add_runtime_dependency "dry-types", "~> 1.2"
  spec.add_runtime_dependency "faraday", "< 0.15"
  spec.add_runtime_dependency 'faraday_middleware', '< 0.13'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "did_you_mean"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'dotenv', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rb-readline'
  spec.add_development_dependency 'vcr', '~> 4.0.0'
  spec.add_development_dependency 'webmock', '~> 3.5.1'
end
