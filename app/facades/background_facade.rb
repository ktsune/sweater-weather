class BackgroundFacade
  attr_reader :id

  def initialize(city, state)
    @city = city
    @state = state
  end

  def image
    Background.new(unsplash_service.fetch_image(@city, @state))
  end

private

  def unsplash_service
    @_unsplash_service ||= UnsplashService.new
  end
end
