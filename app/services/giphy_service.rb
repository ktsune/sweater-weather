class GiphyService

  # def self.fetch_gif
  #   conn = Faraday.new(url: "http://api.giphy.com") do |f|
  #     f.adapter  Faraday.default_adapter
  #     f.headers['api_key'] = ENV['GIPHY']
  #   end
  #
  #   parse_request = conn.get("/v1/gifs/random")
  #   JSON.parse(parse_request.body, symbolize_names: true)
  # end
  def self.connection
    Faraday.new(url: "http://api.giphy.com") do |f|
      f.adapter  Faraday.default_adapter
      f.headers['api_key'] = ENV['GIPHY']
    end
  end

  def self.fetch_gif(daily_weather_summary)
    binding.pry
    response = connection.get("/v1/gifs/search?q=#{daily_weather_summary}")
    JSON.parse(response.body, symbolize_names: true)
  end

  # def self.fetch(uri)
  # end
end
