module TurboMaterial
  module ChipsInputHelper
    def material_chips_input(kwargs = {})
      render "components/chips_input", **kwargs
    end
  end
end
