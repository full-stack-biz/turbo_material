# frozen_string_literal: true

module TurboMaterial
  module RadioHelper
    def material_radio(kwargs = {})
      render 'components/radio', **kwargs
    end
  end
end
