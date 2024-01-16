module TurboMaterial
  module ChipsSelectHelper
    def material_chips_select(kwargs = {})
      render "components/chips_select", **kwargs
    end
  end
end
