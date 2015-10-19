class AddFieldToItems < ActiveRecord::Migration
  def change
    add_column :items ,:is_veg,:boolean
    add_column :items,:is_nonveg,:boolean
    add_column :items,:is_swaminarayan,:boolean
    add_column :items,:is_jain,:boolean
  end
end
