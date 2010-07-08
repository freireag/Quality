require 'test_helper'

class AdminFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_file" do
    assert_difference('AdminFile.count') do
      post :create, :admin_file => { }
    end

    assert_redirected_to admin_file_path(assigns(:admin_file))
  end

  test "should show admin_file" do
    get :show, :id => admin_files(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_files(:one).to_param
    assert_response :success
  end

  test "should update admin_file" do
    put :update, :id => admin_files(:one).to_param, :admin_file => { }
    assert_redirected_to admin_file_path(assigns(:admin_file))
  end

  test "should destroy admin_file" do
    assert_difference('AdminFile.count', -1) do
      delete :destroy, :id => admin_files(:one).to_param
    end

    assert_redirected_to admin_files_path
  end
end
