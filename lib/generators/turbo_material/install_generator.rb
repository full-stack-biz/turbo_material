# frozen_string_literal: true

module TurboMaterial
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def update_tailwind_config
      tailwind_config_path = Rails.root.join('config/tailwind.config.js')

      if tailwind_config_path.exist?
        insert_into_file tailwind_config_path, after: "content: [" do
          "\n#{TurboMaterial.configuration.tailwind_content.map{ |path| "#{' ' * 8}'#{path}'" }.join(",\n")},"
        end
      end
    end
  end
end
