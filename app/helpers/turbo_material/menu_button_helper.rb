# frozen_string_literal: true

module TurboMaterial
  module MenuButtonHelper
    def material_menu_button(kwargs = {}, &block)
      render 'components/menu_button', **kwargs do
        capture(&block) if block_given?
      end
    end
  end
end
