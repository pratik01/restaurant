class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :cuisines
  has_many :tables
  mount_uploader :logo, ImageUploader
end
