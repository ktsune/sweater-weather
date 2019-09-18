class Unsplash

  attr_accessor :url, :id

  def initialize(city, state)
    response = get_image(city, state)
    @url = response[:urls][:regular]
    @id = response[:id]
  end

  def get_image(city, state)
    UnsplashService.fetch_image(city, state)
  end
end
