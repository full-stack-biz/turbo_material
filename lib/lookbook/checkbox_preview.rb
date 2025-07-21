# frozen_string_literal: true

class CheckboxPreview < Lookbook::Preview
  # @param label text
  # @param disabled toggle
  # @param checked toggle
  def default(label: 'Checkbox', disabled: false, checked: false)
    render 'common/form', helper_name: 'material_checkbox', label: label, name: 'checkbox', id: 'Checkbox',
                          disabled: disabled, checked: checked
  end

  # Multiple checkbox states
  def checkbox_states
    render 'lookbook/checkbox/states'
  end

  # @param group_label text
  # @param option_count number { min: 2, max: 8 }
  def checkbox_group(group_label: 'Select options', option_count: 4)
    render 'lookbook/checkbox/group', group_label: group_label, option_count: option_count
  end

  # Checkboxes with validation states
  def with_validation
    render 'lookbook/checkbox/validation'
  end
end
