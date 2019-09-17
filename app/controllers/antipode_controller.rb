class AntipodeController < ApplicationController
  def index
    city_coords = GeocodingService.fetch_lat_and_long(*params[:location].split(','))
    # @weather = Weather.new(DarkSkyService.fetch_weather_data(coords.lat, coords.long))
    antipode_coords = AntipodeService.fetch_antipode(city_coords.lat, city_coords.long)

    antipode_city_name = GeocodingService.reverse_geocode(antipode_coords.lat, antipode_coords.long)
    # render json: GiphyDarkSkySerializer.new(GiphyDarkSky.new(@weather))
  end
end
