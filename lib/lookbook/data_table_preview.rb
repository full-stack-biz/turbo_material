# frozen_string_literal: true

class DataTablePreview < Lookbook::Preview
  Pagy = Data.define(:page, :limit, :count) do
    def last = (count.to_f / limit).ceil
    def from = ((page - 1) * limit) + 1
    def to = [page * limit, count].min
    def prev = page > 1 ? page - 1 : nil
    def next = page < last ? page + 1 : nil
  end

  def default
    records = [{ id: 1, name: 'Alpha' }, { id: 2, name: 'Beta' }, { id: 3, name: 'Gamma' }]
    render 'common/standalone', helper_name: 'material_data_table',
                                name: 'Items', table_body: 'items', url: '/items', table_params: {},
                                records:, selected_records: [2], pagy: Pagy.new(page: 1, limit: 10, count: 3),
                                table_headers_partial: 'lookbook/data_table_headers',
                                table_contents_partial: 'lookbook/data_table_rows'
  end
end
