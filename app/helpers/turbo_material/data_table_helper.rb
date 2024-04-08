module TurboMaterial
  module DataTableHelper
    def material_data_table(kwargs = {})
      render "components/material_data_table", **kwargs
    end
  end
end
