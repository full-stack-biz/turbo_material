# frozen_string_literal: true

class ChipsInputPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Chips Input', disabled: false, required: false)
    countries = [
      { id: 'US', label: 'United States' },
      { id: 'CA', label: 'Canada' },
      { id: 'GB', label: 'United Kingdom' },
      { id: 'DE', label: 'Germany' },
      { id: 'FR', label: 'France' },
      { id: 'JP', label: 'Japan' }
    ]
    render 'common/form', helper_name: 'material_chips_input',
                                   url: '/countries', name: 'countries', label:, id: 'Input', disabled:, required:,
                                   options: countries
  end
end
