# frozen_string_literal: true

module TurboMaterial
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def update_tailwind_config
      tailwind_css_path = TurboMaterial::Engine.root.join('app/assets/dist/turbo_material/tailwind.css')
      css_content = File.read(tailwind_css_path)
      # Remove comments and content inside curly braces
      css_content.gsub!(/\/\*.*?\*\//m, '')
      css_content.gsub!(/\{[^}]*}/m, '{}')

      class_regex = /\.\\?(!?[-_a-zA-Z0-9]+)(?=[^}]*\{)/
      classes = css_content.scan(class_regex).flatten.uniq.sort
      classes.inspect

      # tailwind_config_path = Rails.root.join('config/tailwind.config.js')
      #
      # if tailwind_config_path.exist?
      #   insert_into_file tailwind_config_path, after: "content: [" do
      #     "\n#{Tailwindcss::Engine.tailwind_content_paths.map{ |path| "#{' ' * 8}'#{path}'" }.join(",\n")},"
      #   end
      # end
    end
  end
end
