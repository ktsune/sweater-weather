class ForecastFacade

  def initialize(city, state)
    @city = city
    @state = state
  end

  def forecast
    Weather.new(dark_sky_service.fetch_weather_data(geocode.lat, geocode.long))
  end

  def geocode
    parsed_json = geocode_service.fetch_lat_and_long(@city, @state)
    Coordinates.new(parsed_json[:results][0][:geometry][:location])
  end

private

  def dark_sky_service
    @_dark_sky_service ||= DarkSkyService.new
  end

  def geocode_service
    @_geocode_service ||= GeocodingService.new
  end
end
