module TurboMaterial
  module RadioHelper
    def material_radio(kwargs = {})
      render "components/radio", **kwargs
    end
  end
end
