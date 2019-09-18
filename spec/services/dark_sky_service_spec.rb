require 'rails_helper'

describe DarkSkyService do
  scenario 'get weather data' do
    VCR.use_cassette('returns_weather', record: :new_episodes) do
      dark_sky_service = DarkSkyService.new
      response = dark_sky_service.fetch_weather_data('39.7392358', '-104.990251')

      expect(response[:currently]).to be_a(Hash)
      expect(response[:currently][:temperature]).to be_a(Float)
    end
  end
end
