class MenusController < ApplicationController

  include CuisineTypesHelper
  def index
    @restaurant = Restaurant.where("user_id=?",current_user.id).first
    @cuisines_sub_false = Cuisine.where("restaurant_id=? and is_subcategory=false",@restaurant.id)
    @cuisines_sub_true = Cuisine.where("restaurant_id=? and is_subcategory=true",@restaurant.id)
    @cusines_type = cuisines_type
  end
end
