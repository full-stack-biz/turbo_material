# frozen_string_literal: true

class ChipPreview < Lookbook::Preview
  # @param label text
  def default(label: 'Chip Label')
    render 'common/standalone', helper_name: 'material_chip', label: label
  end

  # Multiple individual chips with different labels
  def multiple_chips
    chips = ['Design', 'Development', 'Marketing', 'Sales']
    render 'lookbook/chip/multiple', chips: chips
  end

  # Chips with icons and actions
  def with_actions
    render 'lookbook/chip/with_actions'
  end
end