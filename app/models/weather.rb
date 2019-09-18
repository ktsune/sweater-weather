class Weather
  attr_reader :timezone,
              :current_temp,
              :current_summary,
              :current_time,
              :current_humidity,
              :current_uv,
              :current_visibility,
              :feels_like,
              :hourly_data

  def initialize(weather)
    @hourly_data = hourly_weather(weather[:hourly][:data])
    @timezone = weather[:timezone]
    @current_temp = weather[:currently][:temperature]
    @current_summary = weather[:currently][:summary]
    @current_time = weather[:currently][:time]
    @current_humidity = weather[:currently][:humidity]
    @current_uv = weather[:currently][:uvIndex]
    @current_visibility = weather[:currently][:visibility]
    @feels_like = weather[:currently][:apparentTemperature]
  end

  def hourly_weather(data)
    data.take(5).map do |hourly_data|
      {
        time: hourly_data[:time],
        temperature: hourly_data[:temperature],
        summary: hourly_data[:summary],
        precipProbability: hourly_data[:precipProbability]
      }
    end
  end
end
