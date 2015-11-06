class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cuisine_sub_category, only: [:new,:edit]
  respond_to :html,:json
  include CuisinesHelper
  def index
    @restaurant = Restaurant.where("user_id=?",current_user.id).first
    @items = Item.joins(:cuisine).where("cuisines.restaurant_id=?",@restaurant.id)
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_with(@item)
    else
      @cuisine_sub_category = get_cuisine_sbu_category
      render "new"
    end
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private

    def set_cuisine_sub_category
      @cuisine_sub_category = get_cuisine_sbu_category
    end
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit!
    end
end
