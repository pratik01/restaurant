class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :isLike
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
