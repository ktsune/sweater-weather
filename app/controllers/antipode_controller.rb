class AntipodeController < ApplicationController
  def index
    city_coords = GeocodingService.fetch_lat_and_long(params[:location])
    antipode_coords = AntipodeService.fetch_antipode(city_coords.lat, city_coords.long)

    antipode_city_name = GeocodingService.reverse_geocode(antipode_coords.lat, antipode_coords.long)

    forecast = Weather.new(DarkSkyService.fetch_weather_data(antipode_coords.lat, antipode_coords.long))

    antipode_class = Antipode.new(forecast)

    antipode_facade = AntipodeFacade.new(antipode_class, antipode_city_name, params[:location])
    render json: AntipodeSerializer.new(antipode_facade)
  end
end
