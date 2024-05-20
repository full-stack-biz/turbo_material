module TurboMaterial
  module ChipsInputOptionsHelper
    def material_chips_input_options(kwargs = {})
      render "components/chips_input_options", **kwargs
    end
  end
end
