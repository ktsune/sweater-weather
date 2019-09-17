require 'rails_helper'

describe 'user creates account with email and password' do
  it 'receives api key' do
    email = 'sam@gmail.com'
    password = 'test'

    get "/api/v1/users"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    expect(parsed[:api_key]).to eq("jgn983hy48thw9begh98h4539h4")
  end
end
