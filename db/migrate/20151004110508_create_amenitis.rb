class CreateAmenitis < ActiveRecord::Migration
  def change
    create_table :amenitis do |t|
      t.belongs_to :restaurant
      t.belongs_to :restaurant_feature
      t.timestamps
    end
  end
end
