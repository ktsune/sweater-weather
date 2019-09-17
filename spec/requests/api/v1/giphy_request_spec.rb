require 'rails_helper'

describe 'Giphy API' do
  it 'retreives giphy based on daily summary' do

    get "/api/v1/gifs?location=Denver,CO"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    expect(parsed[:data][:images]).to be_an(Array)
  end
end
