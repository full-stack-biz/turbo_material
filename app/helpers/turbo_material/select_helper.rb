module TurboMaterial
  module SelectHelper
    def material_select(kwargs = {})
      render "components/select", **kwargs
    end
  end
end
