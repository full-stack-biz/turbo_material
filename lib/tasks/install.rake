# frozen_string_literal: true

namespace :turbo_material do
  desc 'Installs TurboMaterial'
  task install: :environment do
    Rails::Command.invoke :generate, ['turbo_material:install']
  end
end
