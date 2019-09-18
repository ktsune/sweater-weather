require 'rails_helper'

describe UnsplashService do
  scenario 'get city and state' do
    VCR.use_cassette('unsplash', record: :new_episodes) do
      response = UnsplashService.new.fetch_image('denver', 'CO')

      expect(response).to be_a(Hash)
      expect(response[:urls][:raw]).to be_a(String)
      expect(response[:urls].count).to eq(5)
    end 
  end 
end
