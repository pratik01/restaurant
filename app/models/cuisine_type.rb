class CuisineType < ActiveRecord::Base

  belongs_to :user
  has_many :cuisines
end
