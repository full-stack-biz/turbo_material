class SwitchPreview < Lookbook::Preview

  # @param label text
  # @param true_label text
  # @param false_label text
  # @param disabled toggle
  def default(label: 'Switch', disabled: false, required: false, true_label: nil, false_label: nil)
    render 'common/form', helper_name: 'material_switch', label: label, name: 'checkbox', full_name: 'Input', disabled: disabled, true_label: true_label, false_label: false_label
  end
end
