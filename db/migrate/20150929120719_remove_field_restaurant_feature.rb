class RemoveFieldRestaurantFeature < ActiveRecord::Migration
  def change
    remove_column :restaurant_features, :restaurant_id, :integer
  end
end