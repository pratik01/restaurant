class AddSubCategoryToCuisines < ActiveRecord::Migration
  def change
    add_column :cuisines,:is_subcategory,:boolean
  end
end
