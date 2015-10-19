class AddRestaurantFeaturesToAmenities < ActiveRecord::Migration
  def change
    add_column :amenitis, :restaurant_features, :string
  end
end
