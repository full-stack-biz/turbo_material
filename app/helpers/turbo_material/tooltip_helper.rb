# frozen_string_literal: true

module TurboMaterial
  module TooltipHelper
    def material_tooltip(kwargs = {}, &)
      content = block_given? ? capture(&) : nil
      render 'components/tooltip', **kwargs, content: content
    end
  end
end
