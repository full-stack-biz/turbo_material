# frozen_string_literal: true

require_relative 'lib/turbo_material/version'

Gem::Specification.new do |spec|
  spec.name        = 'turbo_material'
  spec.version     = TurboMaterial::VERSION
  spec.authors     = ['Sergey Moiseev']
  spec.email       = ['moiseev.sergey@gmail.com']
  spec.homepage    = 'https://github.com/full-stack-biz/turbo_material'
  spec.summary     = 'Material Web Components for Hotwire Turbo.'
  spec.license     = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/full-stack-biz/turbo_material'
  # spec.metadata["changelog_uri"] = "https://github.com/full-stack-biz/turbo_material"

  spec.post_install_message = <<~MSG
    Installing `turbo_material` gem. Please, follow the instructions in the README.md file.

    After that, please, run `bin/rails turbo_material:install` to install the gem and add necessary files and configurations to your project.
  MSG

  Gem.post_install do |installer|
    if installer.spec.name == 'turbo_material'
      require_relative 'lib/turbo_material/post_install'
      TurboMaterial.post_install
    end
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'importmap-rails', '~> 2.0.1'
  spec.add_dependency 'rails', '>= 7.1.2', '< 9.0'
  spec.add_dependency 'stimulus-rails', '~> 1.3'
  spec.add_dependency 'tailwindcss-rails' #, '~> 4.0.0'
end
