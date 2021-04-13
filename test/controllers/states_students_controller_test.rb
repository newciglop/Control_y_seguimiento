require 'test_helper'

class StatesStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @states_student = states_students(:one)
  end

  test "should get index" do
    get states_students_url
    assert_response :success
  end

  test "should get new" do
    get new_states_student_url
    assert_response :success
  end

  test "should create states_student" do
    assert_difference('StatesStudent.count') do
      post states_students_url, params: { states_student: { enable: @states_student.enable, name: @states_student.name } }
    end

    assert_redirected_to states_student_url(StatesStudent.last)
  end

  test "should show states_student" do
    get states_student_url(@states_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_states_student_url(@states_student)
    assert_response :success
  end

  test "should update states_student" do
    patch states_student_url(@states_student), params: { states_student: { enable: @states_student.enable, name: @states_student.name } }
    assert_redirected_to states_student_url(@states_student)
  end

  test "should destroy states_student" do
    assert_difference('StatesStudent.count', -1) do
      delete states_student_url(@states_student)
    end

    assert_redirected_to states_students_url
  end
end
