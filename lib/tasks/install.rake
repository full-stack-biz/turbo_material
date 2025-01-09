# frozen_string_literal: true

namespace :turbo_material do
  desc 'Installs TurboMaterial'
  task install: :environment do
    Rails::Command.invoke :generate, ['turbo_material:install']
  end

  desc 'Updates Tailwind configuration'
  task update_tailwind: :environment do
    Rails::Command.invoke :generate, %w[turbo_material:install --update-tailwind-only]
  end
end
