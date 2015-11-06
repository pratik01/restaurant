class CuisineTypesController < ApplicationController
  before_action :set_cuisine_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cuisine_types = CuisineType.where("user_id=?",current_user.id)
    respond_with(@cuisine_types)
  end

  def show
    respond_with(@cuisine_type)
  end

  def new
    @cuisine_type = CuisineType.new
    respond_with(@cuisine_type)
  end

  def edit
  end

  def create
    @cuisine_type = CuisineType.new(cuisine_type_params)
    @cuisine_type.user_id = current_user.id
    @cuisine_type.save
    respond_with(@cuisine_type)
  end

  def update
    @cuisine_type.update(cuisine_type_params)
    respond_with(@cuisine_type)
  end

  def destroy
    @cuisine_type.destroy
    respond_with(@cuisine_type)
  end

  private
    def set_cuisine_type
      @cuisine_type = CuisineType.find(params[:id])
    end

    def cuisine_type_params
      params.require(:cuisine_type).permit(:name)
    end
end
