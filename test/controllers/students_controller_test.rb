require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { address: @student.address, age: @student.age, birthday: @student.birthday, career: @student.career, comment: @student.comment, identification: @student.identification, issued_in: @student.issued_in, last_name: @student.last_name, leader_first: @student.leader_first, leader_second: @student.leader_second, link_data: @student.link_data, link_university: @student.link_university, mail: @student.mail, mail_2: @student.mail_2, name: @student.name, phone: @student.phone, phone_2: @student.phone_2, score: @student.score, semester: @student.semester } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, age: @student.age, birthday: @student.birthday, career: @student.career, comment: @student.comment, identification: @student.identification, issued_in: @student.issued_in, last_name: @student.last_name, leader_first: @student.leader_first, leader_second: @student.leader_second, link_data: @student.link_data, link_university: @student.link_university, mail: @student.mail, mail_2: @student.mail_2, name: @student.name, phone: @student.phone, phone_2: @student.phone_2, score: @student.score, semester: @student.semester } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
