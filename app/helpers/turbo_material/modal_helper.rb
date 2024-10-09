# frozen_string_literal: true

module TurboMaterial
  module ModalHelper
    def material_modal(kwargs = {}, &block)
      render 'components/modal', **kwargs do
        capture(&block) if block_given?
      end
    end
  end
end
