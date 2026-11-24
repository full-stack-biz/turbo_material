# frozen_string_literal: true

class ChipSetPreview < Lookbook::Preview
  def default
    render 'common/standalone', helper_name: 'material_chip_set', chips: [{ label: 'Chip 1' }, { label: 'Chip 2' }]
  end
end
