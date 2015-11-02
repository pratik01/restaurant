class AddDelayTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :delay_time, :integer
  end
end
