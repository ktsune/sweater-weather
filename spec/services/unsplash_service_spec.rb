require 'rails_helper'

describe UnsplashService do
  scenario 'get city and state' do
    response = UnsplashService.fetch_image('denver', 'CO')
    # binding.pry

    expect(response).to be_an(Unsplash)
    expect(response).to be_a(Hash)
    # expect(response).to eq()
  end
end
