require 'rails_helper'

describe 'user account creation' do
  before :each do
    bob = User.create!(email: "whatever@example.com", password: "password", password_confirmation: 'password')

    login_params = {
      "email": "whatever@example.com",
      "password": "password"
    }
    post "/api/v1/sessions", params: login_params
  end

  it 'user logs in and receives api key' do

    expect(response.status).to eq 200
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)
  end
end
