class ChipsSelectPreview < Lookbook::Preview

  # @param label text
  # @param disabled toggle
  # @param required toggle
  def default(label: 'Input', disabled: false, required: false)
    render 'common/form', helper_name: 'material_chips_select', label: label, name: 'checkbox',
                                   id: 'Input', disabled: disabled, value: [],
                                   options: [
                                     { value: '1', label: 'Option 1' },
                                     { value: '2', label: 'Option 2' },
                                     { value: '3', label: 'Option 3' }
                                   ]
  end
end
