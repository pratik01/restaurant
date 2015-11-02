class MenusController < ApplicationController

  include CuisinesHelper
  def index
    @cuisines = Cuisine.order("cuisine_type,is_subcategory")
    @cusines_type = cuisines_type
  end
end
