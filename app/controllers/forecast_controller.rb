class ForecastController < ApplicationController
  def index
    coords = GeocodingService.fetch_lat_and_long(*params[:location].split(','))
    weather = Weather.new(DarkSkyService.fetch_weather_data(coords.lat, coords.long))

    render json: ForecastSerializer.new(weather)
  end
end
