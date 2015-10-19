require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { address1: @restaurant.address1, address2: @restaurant.address2, city: @restaurant.city, contact1: @restaurant.contact1, contact2: @restaurant.contact2, country: @restaurant.country, description: @restaurant.description, is_active: @restaurant.is_active, logo: @restaurant.logo, name: @restaurant.name, resister_date: @restaurant.resister_date, state: @restaurant.state, zip_code: @restaurant.zip_code }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { address1: @restaurant.address1, address2: @restaurant.address2, city: @restaurant.city, contact1: @restaurant.contact1, contact2: @restaurant.contact2, country: @restaurant.country, description: @restaurant.description, is_active: @restaurant.is_active, logo: @restaurant.logo, name: @restaurant.name, resister_date: @restaurant.resister_date, state: @restaurant.state, zip_code: @restaurant.zip_code }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
