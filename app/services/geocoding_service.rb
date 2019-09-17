class GeocodingService

  def self.fetch_lat_and_long(city)
    parsed_json = fetch("/maps/api/geocode/json?address=#{city}&key=#{ENV['GOOGLE']}")

    Coordinates.new(parsed_json[:results][0][:geometry][:location])
  end

  private

  def self.fetch(uri)
    conn = Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.adapter  Faraday.default_adapter
    end
    parse_request = conn.get(uri)
    JSON.parse(parse_request.body, symbolize_names: true)
  end

  def self.reverse_geocode(lat, long)
    conn = Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.adapter  Faraday.default_adapter
    end
    response = conn.get("/maps/api/geocode/json?latlng=#{lat},#{long}&key=#{ENV['GOOGLE']}")

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:results][0][:address_components][0][:long_name]
  end
end
