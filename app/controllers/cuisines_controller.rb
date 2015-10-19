class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]
  before_action :set_cuisine_type,only: [:new,:edit]
  include CuisinesHelper
  respond_to :html

  def index
    @cuisines = Cuisine.all
    respond_with(@cuisines)
  end

  def show
    respond_with(@cuisine)
  end

  def new
    @cuisine = Cuisine.new
    respond_with(@cuisine)
  end

  def edit
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      puts "save"
      respond_with(@cuisine)
    else
      @cusines_type = cuisines_type
      render "new"
    end
  end

  def update
    @cuisine.update(cuisine_params)
    respond_with(@cuisine)
  end

  def destroy
    @cuisine.destroy
    respond_with(@cuisine)
  end

  private

    def set_cuisine_type
      @cusines_type = cuisines_type
    end
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])
    end

    def cuisine_params
      params.require(:cuisine).permit!
    end
end
