class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.text :review
      t.integer :rating
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
