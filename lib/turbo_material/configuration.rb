module TurboMaterial
  class Configuration
    attr_accessor :tailwind_content

    def initialize
      @tailwind_content = %W[
        #{TurboMaterial::Engine.root}/app/views/**/*.{erb,haml,html,slim}
        #{TurboMaterial::Engine.root}/app/helpers/**/*.rb
        #{TurboMaterial::Engine.root}/app/assets/javascripts/**/*.js
      ]
    end
  end
end

