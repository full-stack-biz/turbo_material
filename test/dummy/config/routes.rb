# frozen_string_literal: true

Rails.application.routes.draw do
  mount TurboMaterial::Engine => '/turbo_material'
  mount Lookbook::Engine, at: '/lookbook'

  get '/countries' => 'countries#countries', as: :countries
end
