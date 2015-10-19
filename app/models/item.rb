class Item < ActiveRecord::Base

  belongs_to :cuisine
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :cuisine_id, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0
end
