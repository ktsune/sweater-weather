class AntipodeService
  def self.connection
    Faraday.new(url: "http://amypode.herokuapp.com") do |f|
      f.adapter  Faraday.default_adapter
      f.headers['api_key'] = "oscar_the_grouch"
    end
  end

  def self.fetch_antipode(lat, long)

    response = connection.get("/api/v1/antipodes?lat=#{lat}&long=#{long}")
    parsed = JSON.parse(response.body, symbolize_names: true)

    Coordinates.new(parsed[:data][:attributes])
  end
end
