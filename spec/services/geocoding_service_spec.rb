require 'rails_helper'

describe GeocodingService do
  scenario 'pass in city and state, get lat and long' do
    VCR.use_cassette('geocode', record: :new_episodes) do
      geocode = GeocodingService.new
      response = geocode.fetch_lat_and_long('denver', 'CO')

      expect(response[:results][0][:geometry][:location]).to be_a(Hash)
      expect(response[:results][0]).to be_an(Hash)
      expect(response[:results]).to be_a(Array)
    end
  end
end
