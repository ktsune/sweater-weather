require 'rails_helper'

describe 'Giphy API' do
  it 'retreives giphy based on daily summary' do

    get "/api/v1/gifs"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    expect(parsed[0]).to be_an(Array)
  end
end
