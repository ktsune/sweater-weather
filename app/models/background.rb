class Background
  attr_accessor :url, :id

  def initialize(data)
    @url = data[:urls][:regular]
    @id = data[:id]
  end
end
