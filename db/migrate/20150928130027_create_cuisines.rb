class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :name
      t.belongs_to :cuisine_type
      t.text :description
      t.boolean :status
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
