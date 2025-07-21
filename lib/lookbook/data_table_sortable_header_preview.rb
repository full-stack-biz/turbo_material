# frozen_string_literal: true

class DataTableSortableHeaderPreview < Lookbook::Preview
  # @param label text
  # @param sort_direction select { choices: [none, ascending, descending] }
  # @param column_id text
  def default(label: 'Sortable Column', sort_direction: 'none', column_id: 'sortable_column')
    render 'lookbook/data_table_sortable_header/example',
           label: label, sort_value: sort_direction, column_id: column_id
  end

  # Multiple sortable headers showing different states
  def multiple_states
    render 'lookbook/data_table_sortable_header/multiple_states'
  end
end