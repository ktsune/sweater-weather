class GiphyDarkSky
  attr_accessor :copyright, :url, :time, :summary

  def initialize(weather)
    @url = giphy_url(weather)
    @time = weather.daily_time
    @summary = weather.daily_weather_summary
    @copyright = "2019"
    # @images = images
  end

  def giphy_url(weather)
    # => get daily summary
    # => make api call for each day to giphy
    # => need to map over array of daily weather summaries and make api call
    # => on that
    weather.daily_weather_summary.map do |daily_summary|
      response = GiphyService.fetch_gif(daily_summary)
      response[:data][0][:url]
    end
  end

  # def images
  #
  # end
end
