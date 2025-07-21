# frozen_string_literal: true

class AccessibilityPreview < Lookbook::Preview
  # Form with proper ARIA labels and descriptions
  def form_accessibility
    render 'lookbook/accessibility/form_example'
  end

  # Data table with screen reader support
  def table_accessibility
    render 'lookbook/accessibility/table_example'
  end

  # Modal dialogs with focus management
  def modal_accessibility
    render 'lookbook/accessibility/modal_example'
  end

  # Interactive components with keyboard navigation
  def keyboard_navigation
    render 'lookbook/accessibility/keyboard_example'
  end

  # Components with high contrast and visual indicators
  def visual_accessibility
    render 'lookbook/accessibility/visual_example'
  end
end