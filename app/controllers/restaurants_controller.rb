class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  include CuisinesHelper
  respond_to :html

  def index
    @restaurants = Restaurant.all
    respond_with(@restaurants)
  end

  def show
    @cusines_type = cuisines_type
    @id = @restaurant.id
    @cuisines = Cuisine.where("restaurant_id=?",@id).order("cuisine_type,is_subcategory")
    respond_with(@restaurant)
  end

  def new
    @restaurant = Restaurant.new
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    @restaurant.save
    respond_with(@restaurant)
  end

  def update
    @restaurant.update(restaurant_params)
    respond_with(@restaurant)
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.includes(:ameniti).find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit!
    end
end
