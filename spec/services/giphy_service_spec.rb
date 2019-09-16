require 'rails_helper'

describe GiphyService do
  scenario 'get gif' do
    service = GiphyService.new
    response = service.fetch_gif

    expect(response[:data]).to be_a(Hash)
    expect(response[:data][:slug]).to be_a(String)
  end
end
