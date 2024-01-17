class ModalPreview < Lookbook::Preview
  def default
    render 'common/standalone', helper_name: 'material_modal'
  end
end
