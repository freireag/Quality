require 'test_helper'

class CourseClassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_class" do
    assert_difference('CourseClass.count') do
      post :create, :course_class => { }
    end

    assert_redirected_to course_class_path(assigns(:course_class))
  end

  test "should show course_class" do
    get :show, :id => course_classes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => course_classes(:one).to_param
    assert_response :success
  end

  test "should update course_class" do
    put :update, :id => course_classes(:one).to_param, :course_class => { }
    assert_redirected_to course_class_path(assigns(:course_class))
  end

  test "should destroy course_class" do
    assert_difference('CourseClass.count', -1) do
      delete :destroy, :id => course_classes(:one).to_param
    end

    assert_redirected_to course_classes_path
  end
end
