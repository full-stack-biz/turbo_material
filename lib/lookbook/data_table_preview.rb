# frozen_string_literal: true

class DataTablePreview < Lookbook::Preview
  # @param name text
  def default(name: 'Users')
    mock_records = [
      { id: 1, first_name: 'John', last_name: 'Doe', email: 'john@example.com', role: 'Admin' },
      { id: 2, first_name: 'Jane', last_name: 'Smith', email: 'jane@example.com', role: 'User' },
      { id: 3, first_name: 'Bob', last_name: 'Johnson', email: 'bob@example.com', role: 'User' }
    ]
    
    mock_pagy = OpenStruct.new(
      from: 1, to: 3, count: 3, page: 1, last: 1, prev: nil, next: nil,
      items: 10
    )
    
    render 'lookbook/data_table/example', 
           name: name,
           records: mock_records,
           selected_records: ['1'],
           pagy: mock_pagy
  end

  # @param with_selection toggle
  def with_pagination(with_selection: true)
    mock_records = (1..25).map do |i|
      { id: i, first_name: "User#{i}", last_name: "Last#{i}", email: "user#{i}@example.com", role: i.even? ? 'Admin' : 'User' }
    end
    
    mock_pagy = OpenStruct.new(
      from: 1, to: 10, count: 25, page: 1, last: 3, prev: nil, next: 2,
      items: 10
    )
    
    selected = with_selection ? ['1', '3', '5'] : []
    
    render 'lookbook/data_table/example',
           name: 'Users with Pagination',
           records: mock_records[0..9],
           selected_records: selected,
           pagy: mock_pagy
  end
end