class CreateUtilities < ActiveRecord::Migration
  def self.up
    create_table :utilities do |t|
      t.string :name   
      t.string :utility_type  
      t.timestamps
    end
  end

  def self.down
    drop_table :utilities
  end
end
