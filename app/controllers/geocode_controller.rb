class GeocodeController < ApplicationController
  def index
    # binding. pry
    render json: CoordinatesSerializer.new(GeocodingService.fetch_lat_and_long('Denver', 'Colorado'))
  end
end
