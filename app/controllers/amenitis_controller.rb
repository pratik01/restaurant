class AmenitisController < ApplicationController
  before_action :set_ameniti, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:new,:edit]
  respond_to :html

  def index
    @amenitis = Ameniti.all
    respond_with(@amenitis)
  end

  def show
    respond_with(@ameniti)
  end

  def new
    @ameniti = Ameniti.new
    @restaurant_features = RestaurantFeature.all
    respond_with(@ameniti)
  end

  def edit
    @restaurant_features = RestaurantFeature.all
  end

  def create
    @ids = params[:ameniti][:restaurant_feature_id]
    @ids.reject!(&:empty?)
    puts @ids.to_s
    @ids.each do |id|
      @ameniti = Ameniti.new(ameniti_params)
      @ameniti.restaurant_feature_id = id
      @ameniti.save
    end
    respond_with(@ameniti)
  end

  def update
    @ameniti.update(ameniti_params)
    respond_with(@ameniti)
  end

  def destroy
    @ameniti.destroy
    respond_with(@ameniti)
  end

  private
    def set_restaurant
      @restaurants = Restaurant.where("user_id=?",current_user.id)
    end

    def set_ameniti
      @ameniti = Ameniti.find(params[:id])
    end

    def ameniti_params
      params.require(:ameniti).permit!
    end
end
