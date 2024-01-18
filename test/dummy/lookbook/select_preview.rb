class SelectPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Select', disabled: false, required: false)
    render 'common/form', helper_name: 'material_select', label: label, name: 'checkbox', id: 'Input', disabled: disabled, required: required, options: [
      { value: '', label: '-' },
      { value: 'on', label: 'On' },
      { value: 'off', label: 'Off' }
    ]
  end
end
