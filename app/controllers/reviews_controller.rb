class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :set_restaurant
  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]
    @review.save
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    @review.restaurant_id = params[:restaurant_id]
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    def review_params
      params.require(:review).permit!
    end
end
