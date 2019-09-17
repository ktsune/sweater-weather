class Weather
  attr_reader :timezone,
              :current_temp,
              :current_summary,
              :current_time,
              :current_humidity,
              :current_uv,
              :current_visibility,
              :feels_like,
              :hourly_precip,
              :hourly_time,
              :hourly_temp,
              :hourly_summary,
              :daily_weather_summary,
              :daily_time

  def initialize(weather)
    @timezone = weather[:timezone]

    @current_temp = weather[:currently][:temperature]
    @current_summary = weather[:currently][:summary]
    @current_time = weather[:currently][:time]
    @current_humidity = weather[:currently][:humidity]
    @current_uv = weather[:currently][:uvIndex]
    @current_visibility = weather[:currently][:visibility]

    @feels_like = weather[:currently][:apparentTemperature]

    @daily_weather_summary = summary(weather)
    @daily_time = time(weather)

    @hourly_precip = weather[:hourly][:precipProbability]
    @hourly_time = weather[:hourly][:time]
    @hourly_temp = weather[:hourly][:temperature]
    @hourly_summary = weather[:hourly][:summary]
  end

  def summary(weather)
    weather[:daily][:data].map do |data|
      data[:summary]
    end
  end

  def time(weather)
    weather[:daily][:data].map do |data|
      data[:time]
    end
  end
end
