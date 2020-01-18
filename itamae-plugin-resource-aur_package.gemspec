lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-resource-aur_package"
  spec.version       = '0.1.0'
  spec.authors       = ["Masataka Pocke Kuwabara"]
  spec.email         = ["kuwabara@pocke.me"]

  spec.summary       = %q{An Itamae resource for AUR}
  spec.description   = %q{An Itamae resource for AUR (Arch User Repository)}
  spec.homepage      = "https://github.com/pocke/itamae-plugin-resource-aur_package"
  spec.license       = 'CC-0-1.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "itamae"
  spec.add_development_dependency "bundler", ">= 2"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "docker-api"
  spec.add_development_dependency "serverspec"
end
