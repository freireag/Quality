require 'test_helper'

class StudentClassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_class" do
    assert_difference('StudentClass.count') do
      post :create, :student_class => { }
    end

    assert_redirected_to student_class_path(assigns(:student_class))
  end

  test "should show student_class" do
    get :show, :id => student_classes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => student_classes(:one).to_param
    assert_response :success
  end

  test "should update student_class" do
    put :update, :id => student_classes(:one).to_param, :student_class => { }
    assert_redirected_to student_class_path(assigns(:student_class))
  end

  test "should destroy student_class" do
    assert_difference('StudentClass.count', -1) do
      delete :destroy, :id => student_classes(:one).to_param
    end

    assert_redirected_to student_classes_path
  end
end
