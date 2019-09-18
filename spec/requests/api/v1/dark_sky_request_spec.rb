require 'rails_helper'

describe 'Dark Sky API' do
  it 'pass in city and state, get gif' do

    get "/api/v1/forecast?location=Denver,CO"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    # expect(parsed[:current]).to be_a(Hash)
    # binding.pry
  end
end
