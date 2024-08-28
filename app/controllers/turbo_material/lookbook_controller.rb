# frozen_string_literal: true

module TurboMaterial
  class LookbookController < if defined?(Lookbook)
                               Lookbook::PreviewController
                             else
                               ActionController::Base
                             end
    layout 'turbo_material/lookbook'
  end
end
