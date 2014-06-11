require 'test_helper'

class CommDevicesControllerTest < ActionController::TestCase
  setup do
    @comm_device = comm_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comm_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comm_device" do
    assert_difference('CommDevice.count') do
      post :create, comm_device: {  }
    end

    assert_redirected_to comm_device_path(assigns(:comm_device))
  end

  test "should show comm_device" do
    get :show, id: @comm_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comm_device
    assert_response :success
  end

  test "should update comm_device" do
    patch :update, id: @comm_device, comm_device: {  }
    assert_redirected_to comm_device_path(assigns(:comm_device))
  end

  test "should destroy comm_device" do
    assert_difference('CommDevice.count', -1) do
      delete :destroy, id: @comm_device
    end

    assert_redirected_to comm_devices_path
  end
end
