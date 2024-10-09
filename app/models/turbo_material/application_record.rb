# frozen_string_literal: true

module TurboMaterial
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
