class UnsplashService
  def connection
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.adapter  Faraday.default_adapter
      f.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
    end
  end

  def fetch_image(city, state)
    response = connection.get("/photos/random?query=#{city},#{state}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
