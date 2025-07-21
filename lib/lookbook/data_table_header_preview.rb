# frozen_string_literal: true

class DataTableHeaderPreview < Lookbook::Preview
  # @param label text
  # @param column_id text
  def default(label: 'Column Name', column_id: 'column_name')
    render 'common/standalone', helper_name: 'material_data_table_header', 
           label: label, column_id: column_id
  end

  # Multiple headers in a table context
  def multiple_headers
    render 'lookbook/data_table_header/multiple'
  end
end