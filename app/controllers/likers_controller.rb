class LikersController < ApplicationController
  include LikersHelper
  def index
  end

  def save
    @like = Like.where("restaurant_id=? and user_id=?",params[:like][:restaurant_id],current_user.id).first
    if @like.nil? || @like.blank?
      @like = Like.new
    end
    @like.restaurant_id = params[:like][:restaurant_id]
    @like.is_like = params[:like][:isLike]
    @like.user_id = current_user.id
    @like.save
    @count = count_likes(@like.restaurant_id)
    @data = {"status"=>true,"count"=>@count}
    respond_to do |format|
      format.json {render :json => @data}
    end
  end
end
