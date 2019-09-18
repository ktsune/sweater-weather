require 'rails_helper'

describe 'Unsplash API' do
  it 'pass in city and state, get gif' do
    VCR.use_cassette('unsplash', record: :new_episodes) do

      get "/api/v1/background?location=Denver,CO"

      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed[:data][:attributes][:image][:url]).to be_a(String)
    end
  end
end
