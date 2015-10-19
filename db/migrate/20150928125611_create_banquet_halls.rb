class CreateBanquetHalls < ActiveRecord::Migration
  def change
    create_table :banquet_halls do |t|
      t.integer :capacity_of_guest
      t.string :category
      t.float :price
      t.string :description
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
