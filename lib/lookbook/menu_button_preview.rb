class MenuButtonPreview < Lookbook::Preview

  # @param button_text text
  def default(button_text: 'Menu')
    render 'common/standalone', helper_name: 'material_menu_button', button_text:, menu_contents_partial: 'common/menu_contents'
  end
end
