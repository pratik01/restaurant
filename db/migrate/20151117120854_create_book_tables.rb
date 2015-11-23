class CreateBookTables < ActiveRecord::Migration
  def change
    create_table :book_tables do |t|
      t.string :firstName
      t.string :lastName
      t.string :contact1
      t.string :contact2
      t.string :email
      t.date :booking_date
      t.time :booking_time
      t.integer :no_of_guest
      t.text :message
      t.belongs_to :user
      t.timestamps
    end
  end
end
