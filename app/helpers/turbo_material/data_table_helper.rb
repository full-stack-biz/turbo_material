module TurboMaterial
  module DataTableHelper
    def material_data_table(kwargs = {})
      render 'components/data_table', **kwargs
    end

    def material_data_table_row_checkbox(kwargs = {})
      render 'components/data_table_row_checkbox', **kwargs
    end

    def aria_sort(key, default: false)
      return 'none' unless (params[:order] == key) || (params[:order].blank? && default)

      (params[:reverse] == 'true') || (params[:reverse].blank? && default) ? 'descending' : 'ascending'
    end

    def sort_arrow(aria_sort)
      aria_sort == 'descending' ? 'arrow_downward' : 'arrow_upward'
    end

    def sort_class(aria_sort)
      aria_sort == 'none' ? '' : ' mdc-data-table__header-cell--sorted'
    end
  end
end
