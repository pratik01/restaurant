class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  include CuisineTypesHelper
  respond_to :html

  def index
    @restaurants = Restaurant.where("user_id=?",current_user.id)
    respond_with(@restaurants)
  end

  def list
    @restaurants = Restaurant.all
    @cuisine_type = CuisineType.select("name").group("name").order("name")
    @areas = Restaurant.select("address1").group("address1").order("address1")
    respond_with(@restaurants)
  end
  def show
    @cusines_type = cuisines_type
    @id = @restaurant.id
    @cuisines = Cuisine.where("restaurant_id=?",@id).order("is_subcategory")
    respond_with(@restaurant)
  end

  def restaurant_profile
    if !params[:id].blank?
      @restaurant = Restaurant.find(params[:id])
      @cuisines_sub_false = Cuisine.where("restaurant_id=? and is_subcategory=false",@restaurant.id)
      @cuisines_sub_true = Cuisine.where("restaurant_id=? and is_subcategory=true",@restaurant.id)
      @cusines_type = list_cuisnes_type(@restaurant.id)
    else
      redirect_to :controller => "restaurants",:action => "list"
    end
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
