require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  describe 'GET /index' do
    before do
      # @restaurants = FactoryBot.create_list(:restaurant, 10)
      @restaurants = FactoryBot.build_list(:restaurant, 10)
      get '/api/v1/restaurants'
    end
    
    it 'returns all restaurants' do
      expect(@restaurants.size).to eq(10)
    end

    it 'wont allow a restaurant without a name' do
      restaurant = FactoryBot.build(:restaurant, name: nil)
      expect(restaurant).to_not be_valid
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end