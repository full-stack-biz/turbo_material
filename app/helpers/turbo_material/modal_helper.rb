module TurboMaterial
  module ModalHelper
    def material_modal(kwargs = {})
      render "components/modal", **kwargs
    end
  end
end
