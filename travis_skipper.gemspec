# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'travis_skipper/version'

Gem::Specification.new do |spec|
  spec.name          = "travis_skipper"
  spec.version       = TravisSkipper::VERSION
  spec.authors       = ["Infakt DevTeam"]
  spec.email         = ["p@infakt.pl"]

  spec.summary       = %q{Skips build on travis}
  spec.description   = %q{Skips build on travis}
  spec.homepage      = "https://github.com/infakt/travis_skipper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'travis', "~> 1.0"
  spec.add_dependency 'dry-configurable', "~> 0.3"
end
