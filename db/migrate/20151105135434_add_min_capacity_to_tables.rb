class AddMinCapacityToTables < ActiveRecord::Migration
  def change
    add_column :tables, :min_capacity, :integer
  end
end
