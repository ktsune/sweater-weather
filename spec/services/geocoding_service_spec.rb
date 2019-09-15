require 'rails_helper'

describe GeocodingService do
  scenario 'get city and state' do
    service = GeocodingService.new
    response = service.fetch_lat_and_long('denver', 'CO')

    expect(response).to be_an(Array)
    # expect(response[0]).to be_an(Array)
  end
end
