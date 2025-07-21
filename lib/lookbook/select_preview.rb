# frozen_string_literal: true

class SelectPreview < Lookbook::Preview
  # @param label text
  # @param disabled toggle
  # @param required toggle
  # @param outlined toggle
  def default(label: 'Select', disabled: false, required: false, outlined: false)
    render 'common/form', helper_name: 'material_select', label: label, name: 'select', id: 'Select',
                          disabled: disabled, required: required, outlined: outlined, options: [
      { value: '', label: '-' },
      { value: 'on', label: 'On' },
      { value: 'off', label: 'Off' }
    ]
  end

  # @param option_count number { min: 3, max: 20 }
  # @param style select { choices: [filled, outlined] }
  def simple_options(option_count: 5, style: 'filled')
    options = (1..option_count).map { |i| { label: "Option #{i}", value: "option_#{i}" } }
    render 'common/form', helper_name: 'material_select',
           label: 'Choose Option',
           name: 'simple_select',
           id: 'simple_select',
           outlined: (style == 'outlined'),
           options: options,
           selected_text: 'Select an option'
  end

  # Select with countries
  def countries
    countries = [
      { label: 'United States', value: 'US' },
      { label: 'Canada', value: 'CA' },
      { label: 'United Kingdom', value: 'GB' },
      { label: 'Germany', value: 'DE' },
      { label: 'France', value: 'FR' },
      { label: 'Japan', value: 'JP' }
    ]
    render 'common/form', helper_name: 'material_select',
           label: 'Country',
           name: 'country',
           id: 'country_select',
           options: countries,
           selected_text: 'Select country'
  end

  # Different select states
  def select_states
    render 'lookbook/select/states'
  end

  # @param fixed toggle
  # @param hint text
  def with_configuration(fixed: false, hint: 'Choose carefully')
    render 'lookbook/select/configured', fixed: fixed, hint: hint
  end
end
