require 'test_helper'

class AmenitisControllerTest < ActionController::TestCase
  setup do
    @ameniti = amenitis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amenitis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ameniti" do
    assert_difference('Ameniti.count') do
      post :create, ameniti: {  }
    end

    assert_redirected_to ameniti_path(assigns(:ameniti))
  end

  test "should show ameniti" do
    get :show, id: @ameniti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ameniti
    assert_response :success
  end

  test "should update ameniti" do
    patch :update, id: @ameniti, ameniti: {  }
    assert_redirected_to ameniti_path(assigns(:ameniti))
  end

  test "should destroy ameniti" do
    assert_difference('Ameniti.count', -1) do
      delete :destroy, id: @ameniti
    end

    assert_redirected_to amenitis_path
  end
end
