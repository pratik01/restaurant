class CreateAssignStaffs < ActiveRecord::Migration
  def change
    create_table :assign_staffs do |t|
      t.integer :user_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
