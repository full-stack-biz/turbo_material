# frozen_string_literal: true

class DataTableRowCheckboxPreview < Lookbook::Preview
  # @param checked toggle
  # @param row_id text
  def default(checked: false, row_id: 'row_1')
    render 'common/standalone', helper_name: 'material_data_table_row_checkbox',
           id: row_id, checked: checked
  end

  # Multiple row checkboxes in different states
  def multiple_states
    render 'lookbook/data_table_row_checkbox/multiple_states'
  end
end