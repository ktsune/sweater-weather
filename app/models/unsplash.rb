class Unsplash

  attr_accessor :url, :id

  def initialize(city, state)
    @response = response(city, state)
    @url = @response[:urls][:regular]
  end

  def response(city, state)
    UnsplashService.fetch_gif(city, state)
  end
end
