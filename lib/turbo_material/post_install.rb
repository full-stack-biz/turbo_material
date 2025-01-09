# frozen_string_literal: true

module TurboMaterial
  def self.post_install
    puts 'TurboMaterial: Running post install tasks...'
  rescue StandardError => e
    puts "TurboMaterial: Failed to update Tailwind configuration. Error: #{e.message}"
    puts "You may need to run 'bin/rails turbo_material:install' manually to complete the setup."
  end
end
