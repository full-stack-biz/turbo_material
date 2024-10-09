# frozen_string_literal: true

module TurboMaterial
  module TooltipHelper
    def material_tooltip(kwargs = {}, &block)
      content = block_given? ? capture(&block) : nil
      render 'components/tooltip', **kwargs, content: content
    end
  end
end
