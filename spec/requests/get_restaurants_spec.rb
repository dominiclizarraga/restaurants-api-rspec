require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  describe 'GET /index' do
    before do
      # FactoryBot.create_list(:restaurant, 10)
      @restaurants = FactoryBot.build_list(:restaurant, 10)
      get '/api/v1/restaurants'
    end
    
    it 'returns all restaurants' do
      expect(@restaurants.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end