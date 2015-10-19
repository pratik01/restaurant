class BanquetHallsController < ApplicationController
  before_action :set_banquet_hall, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @banquet_halls = BanquetHall.all
    respond_with(@banquet_halls)
  end

  def show
    respond_with(@banquet_hall)
  end

  def new
    @banquet_hall = BanquetHall.new
    respond_with(@banquet_hall)
  end

  def edit
  end

  def create
    @banquet_hall = BanquetHall.new(banquet_hall_params)
    @banquet_hall.save
    respond_with(@banquet_hall)
  end

  def update
    @banquet_hall.update(banquet_hall_params)
    respond_with(@banquet_hall)
  end

  def destroy
    @banquet_hall.destroy
    respond_with(@banquet_hall)
  end

  private
    def set_banquet_hall
      @banquet_hall = BanquetHall.find(params[:id])
    end

    def banquet_hall_params
      params.require(:banquet_hall).permit(:capacity_of_guest, :category, :price, :description)
    end
end
