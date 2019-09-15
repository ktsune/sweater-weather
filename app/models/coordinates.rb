class Coordinates
  attr_accessor :lat, :long
  def initialize(coordinates)
    @lat = coordinates.last
    @long = coordinates.last
  end
end
