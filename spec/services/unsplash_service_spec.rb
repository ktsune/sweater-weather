require 'rails_helper'

describe UnsplashService do
  scenario 'get city and state' do
    response = UnsplashService.new.fetch_image('denver', 'CO')

    expect(response).to be_a(Hash)
  end
end
