class GiphyDarkSky
  attr_accessor :copyright, :url, :time, :summary

  def initialize(weather)
    @url = url(weather)
    @time = weather.current_time
    @summary = weather.current_summary
    @copyright = "2019"
    # @images = images
  end

  def url(weather)
    # => get daily summary
    # => make api call for each day to giphy
    # => need to map over array of daily weather summaries and make api call
    # => on that 
    GiphyService.fetch_gif(weather.daily_weather_summary)
  end

  # def images
  #
  # end
end
