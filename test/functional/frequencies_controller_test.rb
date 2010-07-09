require 'test_helper'

class FrequenciesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequency" do
    assert_difference('Frequency.count') do
      post :create, :frequency => { }
    end

    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should show frequency" do
    get :show, :id => frequencies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => frequencies(:one).to_param
    assert_response :success
  end

  test "should update frequency" do
    put :update, :id => frequencies(:one).to_param, :frequency => { }
    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should destroy frequency" do
    assert_difference('Frequency.count', -1) do
      delete :destroy, :id => frequencies(:one).to_param
    end

    assert_redirected_to frequencies_path
  end
end
