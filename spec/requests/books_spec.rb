require 'rails_helper'

describe 'Books API', type: :request do
  it 'returns all books' do
    Book.create(title: '1984', author: 'George Orwell')
    Book.create(title: 'The Time Machine', author: 'H.G Wells')

    get '/api/v1/books'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end