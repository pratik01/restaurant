require 'test_helper'

class BookTablesControllerTest < ActionController::TestCase
  setup do
    @book_table = book_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_table" do
    assert_difference('BookTable.count') do
      post :create, book_table: { booking_date: @book_table.booking_date, booking_time: @book_table.booking_time, contact1: @book_table.contact1, contact2: @book_table.contact2, email: @book_table.email, firstName: @book_table.firstName, lastName: @book_table.lastName, message: @book_table.message, no_of_guest: @book_table.no_of_guest }
    end

    assert_redirected_to book_table_path(assigns(:book_table))
  end

  test "should show book_table" do
    get :show, id: @book_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_table
    assert_response :success
  end

  test "should update book_table" do
    patch :update, id: @book_table, book_table: { booking_date: @book_table.booking_date, booking_time: @book_table.booking_time, contact1: @book_table.contact1, contact2: @book_table.contact2, email: @book_table.email, firstName: @book_table.firstName, lastName: @book_table.lastName, message: @book_table.message, no_of_guest: @book_table.no_of_guest }
    assert_redirected_to book_table_path(assigns(:book_table))
  end

  test "should destroy book_table" do
    assert_difference('BookTable.count', -1) do
      delete :destroy, id: @book_table
    end

    assert_redirected_to book_tables_path
  end
end
