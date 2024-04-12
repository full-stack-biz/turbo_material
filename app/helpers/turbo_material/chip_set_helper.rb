module TurboMaterial
  module ChipSetHelper
    def material_chip_set(kwargs = {})
      render "components/chip_set", **kwargs
    end

    def material_chip(kwargs = {})
      render "components/chip", **kwargs
    end
  end
end
