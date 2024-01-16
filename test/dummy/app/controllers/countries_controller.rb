# frozen_string_literal: true

class CountriesController < ApplicationController
  def countries
    @countries = if params[:query].blank?
                   Carmen::Country.all
                 else
                   Carmen::Country.query_collection.select { |c| c.name.downcase.include?(params[:query].downcase) }
                 end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            [params[:suffix], params[:name], 'panel'].compact_blank.join('-'),
            partial: 'components/chips_input_options',
            locals: {
              label: 'Countries',
              name: params[:name],
              suffix: params[:suffix],
              opened: params[:opened],
              options: @countries.sort_by(&:name).map { |c| { id: c.alpha_3_code, label: c.name } }
            }
          )
        ]
      end
    end
  end
end

