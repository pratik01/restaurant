module RestaurantsHelper

  def getRestaurantList
    @restaurants = Restaurant.where("user_id=?",current_user.id)
  end
end
