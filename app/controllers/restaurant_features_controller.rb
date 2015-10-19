class RestaurantFeaturesController < ApplicationController
  before_action :set_restaurant_feature, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurant_features = RestaurantFeature.all
    respond_with(@restaurant_features)
  end

  def show
    respond_with(@restaurant_feature)
  end

  def new
    @restaurant_feature = RestaurantFeature.new
    respond_with(@restaurant_feature)
  end

  def edit
  end

  def create
    @restaurant_feature = RestaurantFeature.new(restaurant_feature_params)
    @restaurant_feature.save
    respond_with(@restaurant_feature)
  end

  def update
    @restaurant_feature.update(restaurant_feature_params)
    respond_with(@restaurant_feature)
  end

  def destroy
    @restaurant_feature.destroy
    respond_with(@restaurant_feature)
  end

  private
    def set_restaurant_feature
      @restaurant_feature = RestaurantFeature.find(params[:id])
    end

    def restaurant_feature_params
      params.require(:restaurant_feature).permit(:name, :description)
    end
end
