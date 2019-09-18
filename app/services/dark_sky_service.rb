class DarkSkyService
  def fetch_weather_data(lat, long)
    conn = Faraday.new(url: "https://api.darksky.net")
    response = conn.get("/forecast/#{ENV['DARKSKY']}/#{lat},#{long}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
  end
end
