json.array!(@book_tables) do |book_table|
  json.extract! book_table, :id, :firstName, :lastName, :contact1, :contact2, :email, :booking_date, :booking_time, :no_of_guest, :message
  json.url book_table_url(book_table, format: :json)
end
