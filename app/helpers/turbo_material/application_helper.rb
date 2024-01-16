module TurboMaterial
  module ApplicationHelper
    def cast_boolean(param)
      ActiveRecord::Type::Boolean.new.cast(param)
    end
  end
end
