# frozen_string_literal: true

require_relative "lib/unifonic_integration/version"

Gem::Specification.new do |spec|
  spec.name          = "unifonic_integration"
  spec.version       = UnifonicIntegration::VERSION
  spec.authors       = ["Omar Elsamahy"]
  spec.email         = ["omar.elsamahy@inovaeg.com"]

  spec.summary       = "SMS Unifonic"
  spec.description   = "iMPLEMENTS UNIFONIC SMS integration"
  spec.homepage      = "https://github.com/OmarElsamahy/inova_unifonic"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/OmarElsamahy/inova_unifonic"
  spec.metadata["changelog_uri"] = "https://github.com/OmarElsamahy/inova_unifonic/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.files += Dir["config/initializers/*.rb"]

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
end
