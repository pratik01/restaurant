class MenusController < ApplicationController

  include CuisinesHelper
  def index
    @cuisines = Cuisine.all
    @cusines_type = cuisines_type
  end
end
