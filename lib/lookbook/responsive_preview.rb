# frozen_string_literal: true

class ResponsivePreview < Lookbook::Preview
  # @param viewport select { choices: [mobile, tablet, desktop] }
  def responsive_form(viewport: 'desktop')
    render 'lookbook/responsive/form', viewport_class: viewport_class(viewport)
  end

  # @param viewport select { choices: [mobile, tablet, desktop] }
  def responsive_data_table(viewport: 'desktop')
    render 'lookbook/responsive/data_table', viewport_class: viewport_class(viewport)
  end

  # @param viewport select { choices: [mobile, tablet, desktop] }
  def responsive_navigation(viewport: 'desktop')
    render 'lookbook/responsive/navigation', viewport_class: viewport_class(viewport)
  end

  # Mobile-first design patterns
  def mobile_patterns
    render 'lookbook/responsive/mobile_patterns'
  end

  private

  def viewport_class(viewport)
    case viewport
    when 'mobile'
      'max-w-sm mx-auto'
    when 'tablet'
      'max-w-2xl mx-auto'
    when 'desktop'
      'max-w-6xl mx-auto'
    else
      'w-full'
    end
  end
end