# frozen_string_literal: true

class TooltipPreview < Lookbook::Preview
  # @param tooltip_text text
  def default(tooltip_text: 'This is a helpful tooltip')
    render 'lookbook/tooltip/example', tooltip_text: tooltip_text
  end

  # Tooltip with rich content
  def rich_content
    render 'lookbook/tooltip/rich_content'
  end

  # Multiple tooltips with different positions
  def positioning
    render 'lookbook/tooltip/positioning'
  end

  # Tooltip with interactive content
  def with_button
    render 'lookbook/tooltip/with_button'
  end
end