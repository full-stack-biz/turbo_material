class InputPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Input', disabled: false, required: false)
    render 'common/form', helper_name: 'material_input', label: label, name: 'checkbox', full_name: 'Input', disabled: disabled, required: required
  end
end
