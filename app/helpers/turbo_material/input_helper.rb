# frozen_string_literal: true

module TurboMaterial
  module InputHelper
    def material_input(kwargs = {})
      render 'components/input', **kwargs
    end
  end
end
