# frozen_string_literal: true

module TurboMaterial
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    START_MARKER = "// #{Engine.name} raw CSS. This section is auto-generated by the turbo_material installer."
    END_MARKER = "// End of auto-generated #{Engine.name} raw CSS. Version:"
    HEAD_LINKS = <<-HTML.rstrip.freeze


    <link href="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <script src="//cdn.jsdelivr.net/npm/material-components-web@latest/dist/material-components-web.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">#{' '}
    HTML
    CLASS_REGEX = %r(\.\\?(!?[-_a-zA-Z0-9\[\]/:]+)(?=[^}]*\{)).freeze

    def update_tailwind_config
      tailwind_config_path = Rails.root.join('config/tailwind.config.js')

      return unless tailwind_config_path.exist?

      classes = extract_tailwind_classes

      content_config = <<~CONFIG.strip_heredoc
        #{START_MARKER}
        { raw: '<div class="#{classes.join(' ')}"></div>', extension: 'html' },
        #{END_MARKER} #{TurboMaterial::VERSION}
      CONFIG

      if File.read(tailwind_config_path.to_s).include?(START_MARKER)
        gsub_file tailwind_config_path,
                  /#{Regexp.escape(START_MARKER)}.*?#{Regexp.escape(END_MARKER)}.*?$/m do |_match|
          content_config.strip
        end
      else
        insert_into_file tailwind_config_path, after: 'content: [' do
          "\n" + content_config.strip
        end
      end
    end

    def add_turbo_material_js_controllers
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

    private

    def extract_tailwind_classes
      tailwind_css_path = TurboMaterial::Engine.root.join('app/assets/dist/turbo_material/tailwind.css')
      css_content = File.read(tailwind_css_path)
      css_content.gsub!(%r{/\*.*?\*/}m, '')
      css_content.gsub!(/\{[^}]*}/m, '{}')
      css_content.gsub!('>:not([hidden])~:not([hidden])', '')
      css_content.gsub!(/\\\[/, '[')
      css_content.gsub!(/\\\]/, ']')
      css_content.gsub!(%r{\\/}, '/')
      css_content.gsub!(/\\:/, ':')
      css_content.scan(CLASS_REGEX).flatten.uniq.sort
    end
  end
end
