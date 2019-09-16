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

  def initialize(city)
    @conn = Faraday.new(url: "http://api.giphy.com") do |f|
      f.adapter  Faraday.default_adapter
      f.headers['api_key'] = ENV['GIPHY']
    end
  end

  def fetch_gif(city)
    fetch("/v1/gifs/random")
  end

  private

  attr_reader :conn

  def fetch(uri)
    JSON.parse(conn.get(uri).body, symbolize_names: true)
  end
end
