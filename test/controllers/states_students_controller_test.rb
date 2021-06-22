require 'test_helper'

class StatesStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @process = states_students(:one)
  end

  test "should get index" do
    get processes_url
    assert_response :success
  end

  test "should get new" do
    get new_process_url
    assert_response :success
  end

  test "should create process" do
    assert_difference('Process.count') do
      post processes_url, params: {process: {enable: @process.enable, name: @process.name } }
    end

    assert_redirected_to process_url(Process.last)
  end

  test "should show process" do
    get process_url(@process)
    assert_response :success
  end

  test "should get edit" do
    get edit_process_url(@process)
    assert_response :success
  end

  test "should update process" do
    patch process_url(@process), params: {process: {enable: @process.enable, name: @process.name } }
    assert_redirected_to process_url(@process)
  end

  test "should destroy process" do
    assert_difference('Process.count', -1) do
      delete process_url(@process)
    end

    assert_redirected_to processes_url
  end
end
