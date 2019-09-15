class GeocodeController < ApplicationController
  def index
    render json: CoordinatesSerializer.new(GeocodingService.fetch_lat_and_long(*params[:location].split(',')))
  end
end
