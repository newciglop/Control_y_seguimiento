require 'test_helper'

class ResponsibleFunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @responsible_function = responsible_functions(:one)
  end

  test "should get index" do
    get responsible_functions_url
    assert_response :success
  end

  test "should get new" do
    get new_responsible_function_url
    assert_response :success
  end

  test "should create responsible_function" do
    assert_difference('ResponsibleFunction.count') do
      post responsible_functions_url, params: { responsible_function: {  } }
    end

    assert_redirected_to responsible_function_url(ResponsibleFunction.last)
  end

  test "should show responsible_function" do
    get responsible_function_url(@responsible_function)
    assert_response :success
  end

  test "should get edit" do
    get edit_responsible_function_url(@responsible_function)
    assert_response :success
  end

  test "should update responsible_function" do
    patch responsible_function_url(@responsible_function), params: { responsible_function: {  } }
    assert_redirected_to responsible_function_url(@responsible_function)
  end

  test "should destroy responsible_function" do
    assert_difference('ResponsibleFunction.count', -1) do
      delete responsible_function_url(@responsible_function)
    end

    assert_redirected_to responsible_functions_url
  end
end
