class CheckboxPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  def default(label: 'Checkbox', disabled: false)
    render 'common/form', helper_name: 'material_checkbox', label: label, name: 'checkbox', id: 'Checkbox', disabled: disabled
  end
end
