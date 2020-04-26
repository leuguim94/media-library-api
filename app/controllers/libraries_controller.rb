class LibrariesController < ApplicationController

  # GET /libraries
  def index
    catalogue = Rails.cache.fetch("catalogue_#{[Movie.maximum(:updated_at), Season.maximum(:updated_at)].max}") do
      (Movie.all + Season.all).sort_by(&:created_at).to_json
    end

    render json: catalogue
  end
end