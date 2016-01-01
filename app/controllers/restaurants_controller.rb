class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  include CuisineTypesHelper
  respond_to :html
  before_action :login_required, only: [ :new ]
  before_action :role_required, only: [ :new ]
  def index
    @restaurants = Restaurant.where("user_id=?",current_user.id)
    respond_with(@restaurants)
  end

  def list
    if !params.blank?
      if !params[:cuisine_name].blank? && !params[:area_name].blank?

      elsif !params[:cuisine_name].blank?
        @cuisine_name = params[:cuisine_name]
        @r_id = Cuisine.select("restaurant_id").joins(:cuisine_type).where("cuisine_types.name in (?)",@cuisine_name).group("restaurant_id")
        @r_id = @r_id.map{|t| t.restaurant_id}.uniq
        @restaurants = Restaurant.restaurant_id_in(@r_id)
      elsif !params[:area_name].blank?
        @area_name = params[:area_name]
        @restaurants = Restaurant.where("address1 in (?)",@area_name)
      else
        @restaurants = Restaurant.all
      end
    else
      @restaurants = Restaurant.all
    end
    @cuisine_type = CuisineType.select("name").group("name").order("name")
    @areas = Restaurant.select("address1").group("address1").order("address1")
    respond_with(@restaurants)
  end
  def show
    @cuisine_types = cuisines_type
    @id = @restaurant.id
    @cuisines = Cuisine.where("restaurant_id=?",@id).order("is_subcategory")
    respond_with(@restaurant)
  end

  def restaurant_profile
    if !params[:id].blank?
      @restaurant = Restaurant.find(params[:id])
      @cuisines_sub_false = Cuisine.where("restaurant_id=? and is_subcategory=false",@restaurant.id)
      @cuisines_sub_true = Cuisine.where("restaurant_id=? and is_subcategory=true",@restaurant.id)
      @cuisine_types = list_cuisine_types(@restaurant.id)
    else
      redirect_to :controller => "restaurants",:action => "list"
    end
    respond_to do |format|
      format.html {render :layout => "customer"}
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
