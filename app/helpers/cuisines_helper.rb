module CuisinesHelper

  def cuisines_type
    ["Fast Food","Start Up","Main Course","Desserts","Other"]
  end

  def get_cuisine_sbu_category
    @cuisines = Cuisine.where("is_subcategory=?",true)
  end

  def get_cuisine_by_main_course
    @cuisines = Cuisine.where("cuisine_type=?","Main Course")
  end

  def get_cuisine_by_fast_food
    @cuisines = Cuisine.where("cuisine_type=?","Fast Food")
  end

  def get_cuisine_by_start_up
    @cuisines = Cuisine.where("cuisine_type=?","Start Up")
  end

  def get_cuisine_by_desserts
    @cuisines = Cuisine.where("cuisine_type=?","Desserts")
  end
end
