require_relative "lib/turbo_material/version"

Gem::Specification.new do |spec|
  spec.name        = "turbo_material"
  spec.version     = TurboMaterial::VERSION
  spec.authors     = ["Sergey Moiseev"]
  spec.email       = ["moiseev.sergey@gmail.com"]
  spec.homepage    = "https://github.com/full-stack-biz/turbo_material"
  spec.summary     = "Material Web Components for Turbo."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/full-stack-biz/turbo_material"
  # spec.metadata["changelog_uri"] = "https://github.com/full-stack-biz/turbo_material"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.2"
  spec.add_dependency "importmap-rails", "~> 1.2", ">= 1.2.3"
  spec.add_dependency "stimulus-rails", "~> 1.3"
  spec.add_dependency "tailwindcss-rails", "~> 2.0", ">= 2.0.33"
end
