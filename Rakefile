# frozen_string_literal: true

require 'bundler/setup'

APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)
load 'rails/tasks/engine.rake'

require 'bundler/gem_tasks'

# engine.rake only defines app:test, which runs the dummy app's own test folder.
desc 'Run the engine tests'
task(:test) { sh 'bin/rails test' }
task default: :test
