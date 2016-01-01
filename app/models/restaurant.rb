class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :cuisines
  has_many :tables
  has_many :ameniti
  has_many :likes
  mount_uploader :logo, ImageUploader
  validates :name, :presence => true
  validates :address1, :presence => true
  validates :state, :presence => true
  validates :city, :presence => true
  validates :zip_code, :presence => true
  validates :contact1, :presence => true ,:length => {minimum: 5,maximum: 13}
  validates :contact2, :presence => true,:length => {minimum: 5,maximum: 13}

  def self.restaurant_id_in(r_id)
    @restaurants = Restaurant.where("id in (?)",r_id)
  end
end
