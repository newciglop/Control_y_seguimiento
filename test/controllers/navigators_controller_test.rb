require 'test_helper'

class NavigatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @navigator = navigators(:one)
  end

  test "should get index" do
    get navigators_url
    assert_response :success
  end

  test "should get new" do
    get new_navigator_url
    assert_response :success
  end

  test "should create navigator" do
    assert_difference('Navigator.count') do
      post navigators_url, params: { navigator: {  } }
    end

    assert_redirected_to navigator_url(Navigator.last)
  end

  test "should show navigator" do
    get navigator_url(@navigator)
    assert_response :success
  end

  test "should get edit" do
    get edit_navigator_url(@navigator)
    assert_response :success
  end

  test "should update navigator" do
    patch navigator_url(@navigator), params: { navigator: {  } }
    assert_redirected_to navigator_url(@navigator)
  end

  test "should destroy navigator" do
    assert_difference('Navigator.count', -1) do
      delete navigator_url(@navigator)
    end

    assert_redirected_to navigators_url
  end
end
