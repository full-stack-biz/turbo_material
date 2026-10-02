# frozen_string_literal: true

require 'importmap-rails'

module TurboMaterial
  class Engine < ::Rails::Engine
    isolate_namespace TurboMaterial

    initializer 'local_helper.action_controller' do
      helper_paths = Dir[root.join('app/helpers/turbo_material/*_helper.rb')]
      ActiveSupport.on_load :action_controller do
        helper_paths.each { |path| helper "TurboMaterial::#{File.basename(path, '.rb').camelize}".constantize }
      end
    end

    initializer 'turbo_material.tailwindcss' do
      ActiveSupport.on_load(:tailwindcss_rails) do
        config.tailwindcss_rails.engines << TurboMaterial::Engine.engine_name
      end
    end

    initializer 'turbo_material.importmap', before: 'importmap' do |app|
      # NOTE: this will add pins from this engine to the main app
      # https://github.com/rails/importmap-rails#composing-import-maps
      app.config.importmap.paths << root.join('config/importmap.rb')

      # NOTE: something about cache; I did not look into it.
      # https://github.com/rails/importmap-rails#sweeping-the-cache-in-development-and-test
      app.config.importmap.cache_sweepers << root.join('app/assets/javascripts')
    end

    # NOTE: add engine manifest to precompile assets in production
    initializer 'turbo_material.assets' do |app|
      app.config.assets.precompile += %w[turbo_material_manifest]
    end

    initializer 'turbo_material.precompile' do |app|
      app.config.assets.paths << root.join('app/assets/javascripts')
      app.config.assets.precompile << 'turbo_material/application.js'
      app.config.assets.paths << root.join('app/assets/dist')
      app.config.assets.precompile << 'turbo_material/tailwind.css'
    end
  end
end
