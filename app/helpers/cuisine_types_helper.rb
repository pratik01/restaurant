module CuisineTypesHelper

  def cuisines_type
    @cuisine_types = CuisineType.where("user_id=?",current_user.id)
  end

  def list_cuisnes_type(id)
    @cuisine_types = CuisineType.select("cuisine_types.name").joins(:cuisines).where("cuisines.restaurant_id=?",id).group("cuisine_types.name")
  end

end
