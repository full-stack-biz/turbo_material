module TurboMaterial
  module SwitchHelper
    def material_switch(kwargs = {})
      render "components/switch", **kwargs
    end
  end
end
