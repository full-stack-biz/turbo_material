# frozen_string_literal: true

class RadioPreview < Lookbook::Preview
  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Radio', disabled: false, required: false)
    render 'common/form', helper_name: 'material_radio', label: label, name: 'checkbox', id: 'Input',
                          disabled: disabled, required: required
  end
end
