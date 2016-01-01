module LikersHelper
  def count_likes(restaurant_id)
     @count = Like.select("count('*')").where("restaurant_id=? and is_like=true",restaurant_id)
     if @count.count > 0
       @count.count
     else
       @count = ""
     end
  end

  def get_like_class(restaurant_id)
    @count = Like.select("count('*')").where("restaurant_id=? and user_id=? and is_like=true",restaurant_id,current_user.id)
    if !@count.nil? || !@count.blank?
      if @count.count > 0
        "btn-like btn btn-info btn-xs"
      else
        "btn-like btn btn-default btn-xs"
      end
    else
      "btn-like btn btn-default btn-xs"
    end
  end
end
