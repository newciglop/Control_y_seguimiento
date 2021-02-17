require 'test_helper'

class AdminControlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_control = admin_controls(:one)
  end

  test "should get index" do
    get admin_controls_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_control_url
    assert_response :success
  end

  test "should create admin_control" do
    assert_difference('AdminControl.count') do
      post admin_controls_url, params: { admin_control: {  } }
    end

    assert_redirected_to admin_control_url(AdminControl.last)
  end

  test "should show admin_control" do
    get admin_control_url(@admin_control)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_control_url(@admin_control)
    assert_response :success
  end

  test "should update admin_control" do
    patch admin_control_url(@admin_control), params: { admin_control: {  } }
    assert_redirected_to admin_control_url(@admin_control)
  end

  test "should destroy admin_control" do
    assert_difference('AdminControl.count', -1) do
      delete admin_control_url(@admin_control)
    end

    assert_redirected_to admin_controls_url
  end
end
