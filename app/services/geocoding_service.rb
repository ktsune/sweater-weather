class GeocodingService

  def initialize
    #@conn =
  end

  def self.fetch_lat_and_long(city, state)
    parsed_json = fetch("/maps/api/geocode/json?address=#{city},#{state}&key=AIzaSyD7V2YmCNJGwmxjEOenvU95bLXky4iEwos")

    # => response[:results][0][:geometry][:location][:lat][:lng]

    parsed_json[:results][0][:geometry][:location].map do |geocode_data|
      Coordinates.new(geocode_data)
    end
  end

  private

  def self.fetch(uri)
    conn = Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.adapter  Faraday.default_adapter
    end
    parse_request = conn.get(uri)
    JSON.parse(parse_request.body, symbolize_names: true)
  end
end
