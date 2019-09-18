require 'rails_helper'

describe GeocodingService do
  scenario 'pass in city and state, get lat and long' do
    response = GeocodingService.fetch_lat_and_long('denver', 'CO')

    expect(response).to be_a(Coordinates)
    expect(response.lat).to eq(39.7392358)
    expect(response.long).to eq(-104.990251)
  end
end
