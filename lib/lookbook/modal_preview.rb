class ModalPreview < Lookbook::Preview
  # @param title text
  # @param opened toggle
  def default(title: 'Modal Title', opened: false)
    render 'lookbook/modal/example', title: title, opened: opened
  end

  # Modal with form content
  def with_form
    render 'lookbook/modal/with_form'
  end

  # @param button_text text
  # @param cancel_text text
  def with_actions(button_text: 'Save Changes', cancel_text: 'Cancel')
    render 'lookbook/modal/with_actions', button_text: button_text, cancel_text: cancel_text
  end

  # Modal with rich content
  def confirmation_dialog
    render 'lookbook/modal/confirmation'
  end

  # Full-width modal with complex content
  def full_width
    render 'lookbook/modal/full_width'
  end
end
