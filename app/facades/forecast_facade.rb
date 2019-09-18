class ForecastFacade
  
  def initialize(city, state)
    @city = city
    @state = state
  end


private

  def dark_sky_service
    @_dark_sky_service ||= DarkSkyService.new
  end

  def geocode_service
    @_geocode_service ||= GeocodeService.new
  end
end
