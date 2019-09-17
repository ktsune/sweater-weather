class Coordinates
  attr_accessor :lat, :long
  def initialize(coordinates)
    @lat = coordinates[:lat]
    @long = coordinates[:lng] || coordinates[:long]
  end
end
