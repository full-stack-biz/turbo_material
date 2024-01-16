Rails.application.routes.draw do
  mount TurboMaterial::Engine => "/turbo_material"
  mount Lookbook::Engine, at: "/lookbook"
end
