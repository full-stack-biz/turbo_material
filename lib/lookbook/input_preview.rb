# frozen_string_literal: true

class InputPreview < Lookbook::Preview
  # @param label text
  # @param disabled toggle
  # @param required toggle
  # @param style select { choices: [filled, outlined] }
  def default(label: 'Input', disabled: false, required: false, style: 'filled')
    render 'common/form', helper_name: 'material_input', label: label, name: 'input_field', id: 'Input',
                          disabled: disabled, required: required, style: style
  end

  # @param input_type select { choices: [text, email, password, number, tel, url] }
  # @param placeholder text
  def input_types(input_type: 'text', placeholder: 'Enter value...')
    render 'common/form', helper_name: 'material_input', 
           label: "#{input_type.capitalize} Input", 
           name: "#{input_type}_field", 
           id: "#{input_type}_input",
           type: input_type,
           placeholder: placeholder
  end

  # Different input states
  def validation_states
    render 'lookbook/input/validation_states'
  end

  # @param icon_name text
  # @param icon_position select { choices: [leading, trailing] }
  def with_icons(icon_name: 'search', icon_position: 'leading')
    render 'lookbook/input/with_icons', icon_name: icon_name, icon_position: icon_position
  end

  # @param helper_text text
  # @param persistent_helper toggle
  def with_helper_text(helper_text: 'This is helper text', persistent_helper: true)
    render 'lookbook/input/with_helper_text', helper_text: helper_text, persistent_helper: persistent_helper
  end
end
