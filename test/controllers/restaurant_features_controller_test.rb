require 'test_helper'

class RestaurantFeaturesControllerTest < ActionController::TestCase
  setup do
    @restaurant_feature = restaurant_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_feature" do
    assert_difference('RestaurantFeature.count') do
      post :create, restaurant_feature: { description: @restaurant_feature.description, name: @restaurant_feature.name }
    end

    assert_redirected_to restaurant_feature_path(assigns(:restaurant_feature))
  end

  test "should show restaurant_feature" do
    get :show, id: @restaurant_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_feature
    assert_response :success
  end

  test "should update restaurant_feature" do
    patch :update, id: @restaurant_feature, restaurant_feature: { description: @restaurant_feature.description, name: @restaurant_feature.name }
    assert_redirected_to restaurant_feature_path(assigns(:restaurant_feature))
  end

  test "should destroy restaurant_feature" do
    assert_difference('RestaurantFeature.count', -1) do
      delete :destroy, id: @restaurant_feature
    end

    assert_redirected_to restaurant_features_path
  end
end
