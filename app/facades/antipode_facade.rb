class AntipodeFacade
  attr_reader :forecast, :location_name, :search_location, :current_temp, :current_summary

  def initialize(antipode, antipode_city_name, location)
    @location_name = antipode_city_name

    @forecast = antipode

    @search_location = location
  end
end
