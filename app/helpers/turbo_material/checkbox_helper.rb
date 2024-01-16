module TurboMaterial
  module CheckboxHelper
    def material_checkbox(kwargs = {})
      render "components/checkbox", **kwargs
    end
  end
end
