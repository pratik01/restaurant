class Cuisine < ActiveRecord::Base
  has_many :items
  belongs_to :restaurant
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :cuisine_type, presence: true

end
