# frozen_string_literal: true

class ChipsInputPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Input', disabled: false, required: false)
    render 'common/form', helper_name: 'material_chips_input',
                                   url: '/countries', name: 'countries', label:, full_name: 'Input', disabled:,
                                   required:,
                                   options: Carmen::Country.all.map { |c| { id: c.alpha_3_code, label: c.name } }
  end
end
