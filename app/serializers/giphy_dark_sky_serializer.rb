class GiphyDarkSkySerializer
  # attributes :id, :summary, :time, :url, :copyright
  # set_type :giphydarksky
  # set_id :id
  def initialize(data)
    images = []
    5.times do |i|
      # binding.pry
      image = {
        url: data.url[i],
        time: data.time[i],
        summary: data.summary[i]
      }
      images << image
    end
    @data = {
      images: images
    }
    # @id = data[:id]
    # @summary = data[:summary]
    # @time = data[:time]
    # @url = data[:url]
    @copyright = "2019"
  end
end
