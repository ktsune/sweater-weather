class DarkSkyService
  def self.fetch_weather_data(lat, long)
    conn = Faraday.new(url: "https://api.darksky.net")
    response = conn.get("/forecast/7a96322b0ffcf976069db9289fb519a4/#{lat},#{long}")
    parsed_json = JSON.parse(response.body, symbolize_names: true)
  end
end
