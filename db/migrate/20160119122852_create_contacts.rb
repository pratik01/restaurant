class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact1
      t.string :contact2
      t.string :email
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.string :city
      t.string :zip_code
      t.belongs_to :user
      t.timestamps
    end
  end
end
