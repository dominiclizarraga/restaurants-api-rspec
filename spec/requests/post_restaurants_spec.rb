require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_restaurant) { FactoryBot.build(:restaurant) }

      before do
        post '/api/v1/restaurants', params:
                          { restaurant: {
                            name: my_restaurant.name,
                            address: my_restaurant.address
                          } }
      end

      it 'returns the name' do
        expect(json['name']).to eq(my_restaurant.name)
      end

      it 'returns the address' do
        expect(json['address']).to eq(my_restaurant.address)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end

    end
  end
end