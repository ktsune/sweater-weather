class AntipodeController < ApplicationController
  def index
    coords = GeocodingService.fetch_lat_and_long(*params[:location].split(','))
    @weather = Weather.new(DarkSkyService.fetch_weather_data(coords.lat, coords.long))
    binding.pry
    coords
    antipode = AntipodeService.fetch_antipode(coords.split(','))
    # render json: GiphyDarkSkySerializer.new(GiphyDarkSky.new(@weather))
  end
end
