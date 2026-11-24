# frozen_string_literal: true

# The gem ships only the drawer controllers; the markup is the host's.
class DrawerPreview < Lookbook::Preview
  # @param opened toggle
  def default(opened: true)
    render 'lookbook/drawer', opened:
  end
end
