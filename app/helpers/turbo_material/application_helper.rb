# frozen_string_literal: true

module TurboMaterial
  module ApplicationHelper
    def cast_boolean(param)
      ActiveModel::Type::Boolean.new.cast(param)
    end
  end
end
