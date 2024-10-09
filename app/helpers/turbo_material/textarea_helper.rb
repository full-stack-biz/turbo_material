# frozen_string_literal: true

module TurboMaterial
  module TextareaHelper
    def material_textarea(kwargs = {})
      render 'components/textarea', **kwargs
    end
  end
end
