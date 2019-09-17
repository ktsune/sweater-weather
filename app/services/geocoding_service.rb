class GeocodingService

  def self.fetch_lat_and_long(city, state)
    parsed_json = fetch("/maps/api/geocode/json?address=#{city},#{state}&key=#{ENV['GOOGLE']}")

    # => response[:results][0][:geometry][:location][:lat][:lng]

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
    parse_request = conn.get(uri)
    JSON.parse(parse_request.body, symbolize_names: true)

    parsed_json = fetch("/api/geocode/json?latlong=#{lat},#{long}&key=#{ENV['GOOGLE']}")
    Coordinates.new(parsed_json[:results][0][:geometry][:location])
  end
end
