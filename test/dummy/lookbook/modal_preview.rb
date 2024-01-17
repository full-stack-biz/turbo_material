class ModalPreview < Lookbook::Preview

  # @param title text
  def default(title: 'Modal')
    render 'common/standalone', helper_name: 'material_modal', title:
  end
end
