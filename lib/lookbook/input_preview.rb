class InputPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  # @param style select { choices: [filled, outlined] }
  def default(label: 'Input', disabled: false, required: false, style: 'filled')
    render 'common/form', helper_name: 'material_input', label: label, name: 'checkbox', id: 'Input', disabled: disabled, required: required, style: style
  end
end
