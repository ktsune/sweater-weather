class Weather
  attr_reader :temp

  def initialize(weather)
    @timezone = weather[:timezone]

    @current_temp = weather[:currently][:temperature]
    @current_temp = weather[:currently][:summary]
    @current_time = weather[:currently][:time]
    @current_humidity = weather[:currently][:humidity]
    @current_uv = weather[:currently][:uvIndex]
    @current_visibility = weather[:currently][:visibility]

    @feels_like = weather[:currently][:apparentTemperature]

    @hourly_precip = weather[:hourly][:precipProbability]
    @hourly_time = weather[:hourly][:time]
    @hourly_temp = weather[:hourly][:temperature]
    @hourly_summary = weather[:hourly][:summary]
  end
end
