class AntipodeController < ApplicationController
  def index
    city_coords = GeocodingService.fetch_lat_and_long(*params[:location].split(','))
    antipode_coords = AntipodeService.fetch_antipode(city_coords.lat, city_coords.long)
    antipode_city_name = GeocodingService.reverse_geocode(Coordinates.new(antipode_coords))
    forecast = Weather.new(DarkSkyService.fetch_weather_data(Coordinates.new(antipode_coords))
    render json: AntipodeSerializer.new(Antipode.new(forecast))
  end
end
