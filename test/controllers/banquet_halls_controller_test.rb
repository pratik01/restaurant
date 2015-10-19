require 'test_helper'

class BanquetHallsControllerTest < ActionController::TestCase
  setup do
    @banquet_hall = banquet_halls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:banquet_halls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banquet_hall" do
    assert_difference('BanquetHall.count') do
      post :create, banquet_hall: { capacity_of_guest: @banquet_hall.capacity_of_guest, category: @banquet_hall.category, description: @banquet_hall.description, price: @banquet_hall.price }
    end

    assert_redirected_to banquet_hall_path(assigns(:banquet_hall))
  end

  test "should show banquet_hall" do
    get :show, id: @banquet_hall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banquet_hall
    assert_response :success
  end

  test "should update banquet_hall" do
    patch :update, id: @banquet_hall, banquet_hall: { capacity_of_guest: @banquet_hall.capacity_of_guest, category: @banquet_hall.category, description: @banquet_hall.description, price: @banquet_hall.price }
    assert_redirected_to banquet_hall_path(assigns(:banquet_hall))
  end

  test "should destroy banquet_hall" do
    assert_difference('BanquetHall.count', -1) do
      delete :destroy, id: @banquet_hall
    end

    assert_redirected_to banquet_halls_path
  end
end
