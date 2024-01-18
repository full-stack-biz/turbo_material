class TextareaPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Text', disabled: false, required: false)
    render 'common/form', helper_name: 'material_textarea', label: label, name: 'textarea', id: 'Text', disabled: disabled, required: required
  end
end
