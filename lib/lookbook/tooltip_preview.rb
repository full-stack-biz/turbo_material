# frozen_string_literal: true

class TooltipPreview < Lookbook::Preview
  # @param text text
  def default(text: 'Tooltip text')
    render 'lookbook/tooltip', text:
  end
end
