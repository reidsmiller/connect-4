# frozen_string_literal: true

require_relative "lib/cnnct4/version"

Gem::Specification.new do |spec|
  spec.name = "cnnct4"
  spec.version = Cnnct4::VERSION
  spec.authors = ["Reid Miller", "Thomas Hawley"]
  spec.email = ["reid.s.miller@gmail.com", "tchawley2@gmail.com"]

  spec.summary = "Thomas and Reid's Connect 4 game."
  spec.description = "A CLI connect 4 game playable by 1 or 2 players"
  spec.homepage = "https://github.com/reidsmiller/connect-4"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/reidsmiller/connect-4"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "thor"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec", "~> 3.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
