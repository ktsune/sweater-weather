class GiphyFacade

  def initialize
    @service = GiphyService.new
  end

  def gif
    @_gif ||= get_gif
  end

 private

 attr_reader :service

  def get_gif
    service.fetch_gif.map do |gif_data|
      Gif.new(gif_data)
    end
  end
end
