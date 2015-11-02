class Ameniti < ActiveRecord::Base
  belongs_to :restaurant_feature
  belongs_to :restaurant
end
