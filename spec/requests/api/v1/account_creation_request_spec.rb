require 'rails_helper'

describe 'user account creation' do
  it 'user creates account and receives api key' do
    params = {
      "email": "bob@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post "/api/v1/users", params: params

    expect(response.status).to eq 201
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)
  end

  it 'user password and confirmation password do not match' do
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "pass"
    }
    post "/api/v1/users", params: params

    expect(response.status).to eq 400
  end

  it 'email cannot be blank' do
    params = {
      "email": " ",
      "password": "password",
      "password_confirmation": "pass"
    }
    post "/api/v1/users", params: params

    expect(response.status).to eq 400
  end

  it 'user email is already taken' do
    params = {
      "email": "susan@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post "/api/v1/users", params: params

    params1 = {
      "email": "susan@example.com",
      "password": "word",
      "password_confirmation": "word"
    }
    post "/api/v1/users", params: params

    expect(response.status).to eq 400
  end

  it 'errors out if the correct info is not entered' do
    params = {
      "email": " ",
      "password": " ",
      "password_confirmation": "word"
    }

    post "/api/v1/users", params: params

    expect(response.status).to eq 400
  end
end
