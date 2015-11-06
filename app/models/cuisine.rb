class Cuisine < ActiveRecord::Base
  has_many :items
  belongs_to :restaurant
  belongs_to :cuisine_type
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :cuisine_type, presence: true

end
