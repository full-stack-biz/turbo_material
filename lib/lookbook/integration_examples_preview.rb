# frozen_string_literal: true

class IntegrationExamplesPreview < Lookbook::Preview
  # Complete user profile form
  def user_profile_form
    render 'lookbook/integration/user_profile_form'
  end

  # Dashboard with multiple components
  def dashboard_layout
    render 'lookbook/integration/dashboard'
  end

  # Search interface with filters
  def search_interface
    render 'lookbook/integration/search_interface'
  end

  # Settings panel with various controls
  def settings_panel
    render 'lookbook/integration/settings_panel'
  end

  # Data management interface
  def data_management
    render 'lookbook/integration/data_management'
  end
end