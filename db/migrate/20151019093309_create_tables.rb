class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :code
      t.integer :capacity
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
