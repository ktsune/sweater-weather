require 'rails_helper'

describe 'user account' do
  it 'user creates account and receives api key' do
    bob = User.create!(email: 'bob@bobtown.com', password: 'bobness', password_confirmation: 'bobness')
    sam = User.create!(email: 'sam@samtown.com', password: 'samness', password_confirmation: 'samness')

    @params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post "/api/v1/users", params: @params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
  end

  it 'user logs in and receives api key' do
    email = 'sam@gmail.com'
    password = 'test'

    @params = {
      "email": "whatever@example.com",
      "password": "password"
    }

    post "/api/v1/sessions", params: @params

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
  end
end
