# frozen_string_literal: true

require 'turbo_material/version'
require 'turbo_material/engine'
require 'turbo_material/configuration'

module TurboMaterial
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
