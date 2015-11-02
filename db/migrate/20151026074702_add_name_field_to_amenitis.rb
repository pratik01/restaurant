class AddNameFieldToAmenitis < ActiveRecord::Migration
  def change
    add_column :amenitis, :name, :string
  end
end
