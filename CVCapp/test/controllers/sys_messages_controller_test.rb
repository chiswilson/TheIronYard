require 'test_helper'

class SysMessagesControllerTest < ActionController::TestCase
  setup do
    @sys_message = sys_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sys_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sys_message" do
    assert_difference('SysMessage.count') do
      post :create, sys_message: {  }
    end

    assert_redirected_to sys_message_path(assigns(:sys_message))
  end

  test "should show sys_message" do
    get :show, id: @sys_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sys_message
    assert_response :success
  end

  test "should update sys_message" do
    patch :update, id: @sys_message, sys_message: {  }
    assert_redirected_to sys_message_path(assigns(:sys_message))
  end

  test "should destroy sys_message" do
    assert_difference('SysMessage.count', -1) do
      delete :destroy, id: @sys_message
    end

    assert_redirected_to sys_messages_path
  end
end
