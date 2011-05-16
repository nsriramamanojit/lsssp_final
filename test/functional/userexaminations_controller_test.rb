require 'test_helper'

class UserexaminationsControllerTest < ActionController::TestCase
  setup do
    @userexamination = userexaminations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userexaminations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userexamination" do
    assert_difference('Userexamination.count') do
      post :create, :userexamination => @userexamination.attributes
    end

    assert_redirected_to userexamination_path(assigns(:userexamination))
  end

  test "should show userexamination" do
    get :show, :id => @userexamination.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @userexamination.to_param
    assert_response :success
  end

  test "should update userexamination" do
    put :update, :id => @userexamination.to_param, :userexamination => @userexamination.attributes
    assert_redirected_to userexamination_path(assigns(:userexamination))
  end

  test "should destroy userexamination" do
    assert_difference('Userexamination.count', -1) do
      delete :destroy, :id => @userexamination.to_param
    end

    assert_redirected_to userexaminations_path
  end
end
