class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.string :city
      t.string :zip_code
      t.text :description
      t.string :contact1
      t.string :contact2
      t.string :logo
      t.boolean :is_active
      t.date :resister_date
      t.belongs_to :user
      t.timestamps
    end
  end
end
