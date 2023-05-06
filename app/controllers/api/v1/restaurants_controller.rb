class Api::V1::RestaurantsController < ApplicationController
  def index
    @posts = Restaurant.all
    render json: @restaurants
  end

  def create
    @restaurant = Restaurant.create restaurant_params
    
    if @restaurant.valid?
      render json: @restaurant, status: :created
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find params[:id]
    @restaurant.destroy
    render status: :no_content
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
