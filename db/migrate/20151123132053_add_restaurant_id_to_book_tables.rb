class AddRestaurantIdToBookTables < ActiveRecord::Migration
  def change
    add_belongs_to :book_tables ,:restaurant
  end
end
