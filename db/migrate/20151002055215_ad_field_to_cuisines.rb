class AdFieldToCuisines < ActiveRecord::Migration
  def change
    add_column :cuisines,:is_veg,:boolean
    add_column :cuisines,:is_nonveg,:boolean
    add_column :cuisines,:is_swaminarayan,:boolean
    add_column :cuisines,:is_jain,:boolean
    add_column :cuisines,:price,:float
  end
end
