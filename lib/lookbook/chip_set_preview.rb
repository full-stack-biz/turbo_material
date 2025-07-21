# frozen_string_literal: true

class ChipSetPreview < Lookbook::Preview
  # Basic chip set with default chips
  def default
    chips = [
      { label: 'Design' },
      { label: 'Development' },
      { label: 'Marketing' },
      { label: 'Sales' }
    ]
    render 'common/standalone', helper_name: 'material_chip_set', chips: chips
  end

  # @param chip_count number { min: 1, max: 10 }
  def with_custom_count(chip_count: 5)
    chips = (1..chip_count).map { |i| { label: "Chip #{i}" } }
    render 'common/standalone', helper_name: 'material_chip_set', chips: chips
  end

  # Chip set with category-based chips
  def categories
    chips = [
      { label: 'Technology' },
      { label: 'Business' },
      { label: 'Design' },
      { label: 'Marketing' },
      { label: 'Finance' },
      { label: 'Operations' }
    ]
    render 'common/standalone', helper_name: 'material_chip_set', chips: chips
  end

  # Empty chip set
  def empty
    render 'common/standalone', helper_name: 'material_chip_set', chips: []
  end
end