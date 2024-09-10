# frozen_string_literal: true

module TurboMaterial
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def update_tailwind_config
      tailwind_css_path = TurboMaterial::Engine.root.join('app/assets/dist/turbo_material/tailwind.css')
      css_content = File.read(tailwind_css_path)
      css_content.gsub!(/\/\*.*?\*\//m, '')
      css_content.gsub!(/\{[^}]*}/m, '{}')
      css_content.gsub!(/\\\[/, '[')
      css_content.gsub!( /\\\]/, ']')

      class_regex = /\.\\?(!?[-_a-zA-Z0-9\[\]]+)(?=[^}]*\{)/
      classes = css_content.scan(class_regex).flatten.uniq.sort

      tailwind_config_path = Rails.root.join('config/tailwind.config.js')

      if tailwind_config_path.exist?
        content_config = "        { raw: '<div class=\"#{classes.join(' ')}\">', extension: 'html' }, // TurboMaterial raw CSS"
        if File.read(tailwind_config_path).include?('// TurboMaterial raw CSS')
          # Replace the existing TurboMaterial raw CSS line
          gsub_file tailwind_config_path, /^.*\/\/ TurboMaterial raw CSS.*$/, content_config
        else
          # Insert the new configuration if it doesn't exist
          insert_into_file tailwind_config_path, after: "content: [" do
            content_config
          end
        end
      end
    end
  end
end
