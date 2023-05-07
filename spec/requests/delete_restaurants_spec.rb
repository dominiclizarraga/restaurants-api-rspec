require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  describe "DELETE /destroy" do
    let!(:restaurant) { FactoryBot.create(:restaurant) }

    before do
      delete "/api/v1/restaurants/#{restaurant.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'deletes a restaurant' do
      restaurant.destroy
      expect(restaurant).to be_destroyed
    end
  end
end
