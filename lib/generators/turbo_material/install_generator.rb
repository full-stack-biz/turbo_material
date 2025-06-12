# frozen_string_literal: true

module TurboMaterial
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    HEAD_LINKS = <<-HTML.rstrip.freeze


    <link href="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <script src="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">#{' '}
    HTML

    IMPORT = '@import "../builds/tailwind/turbo_material.css";'.freeze

    def add_turbo_material_tailwind
      return if options[:update_tailwind_only]

      tailwind_path = Rails.root.join('app/assets/tailwind/application.css')
      unless tailwind_path.exist?
        raise '`app/assets/tailwind/application.css` does not exist'
      end

      if tailwind_path.read.include?(IMPORT)
        puts "`app/assets/tailwind/application.css` already contains `#{IMPORT}`"
      else
        insert_into_file tailwind_path, after: '@import "tailwindcss";' do
          "\n#{IMPORT}\n"
        end
      end
    end

    def add_turbo_material_js_controllers
      return if options[:update_tailwind_only]

      controllers_path = Rails.root.join('app/javascript/controllers/index.js')
      if controllers_path.exist? && controllers_path.read.include?('eagerLoadControllersFrom("controllers", application)')
        if controllers_path.read.include?('eagerLoadControllersFrom("turbo_material", application)')
          puts '`app/javascript/controllers/index.js` already contains `eagerLoadControllersFrom("turbo_material", application)`'
        else
          insert_into_file controllers_path, after: 'eagerLoadControllersFrom("controllers", application)' do
            "\neagerLoadControllersFrom(\"turbo_material\", application)\n"
          end
        end
      else
        puts '`app/javascript/controllers/index.js` does not exist or does not contain `eagerLoadControllersFrom("controllers", application)`'
      end
    end

    def add_material_components_web_to_app_layout
      return if options[:update_tailwind_only]

      layout_path = Rails.root.join('app/views/layouts/application.html.erb')
      unless layout_path.exist? && layout_path.read.include?('<%= csp_meta_tag %>')
        raise '`app/views/layouts/application.html.erb` does not exist or does not contain `<%= csp_meta_tag %>`'
      end

      if layout_path.read.include?('<link href="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">')
        puts '`app/views/layouts/application.html.erb` head already contains material components web links'
      else
        insert_into_file layout_path, after: '<%= csp_meta_tag %>' do
          HEAD_LINKS
        end
      end
    end
  end
end
