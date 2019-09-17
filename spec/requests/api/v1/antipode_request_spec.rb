require 'rails_helper'

describe 'Antipode API' do
  it 'retreives antipode' do

    get "/api/v1/antipode?location=Denver,CO"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
  end
end
