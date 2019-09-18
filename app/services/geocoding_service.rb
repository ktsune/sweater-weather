class GeocodingService

  def fetch_lat_and_long(city, state)
    parsed_json = fetch("/maps/api/geocode/json?address=#{city},#{state}&key=#{ENV['GOOGLE']}")
  end

  private

  def fetch(uri)
    conn = Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.adapter  Faraday.default_adapter
    end
    parse_request = conn.get(uri)
    JSON.parse(parse_request.body, symbolize_names: true)
  end
end
