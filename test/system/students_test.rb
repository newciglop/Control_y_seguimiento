require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Address", with: @student.address
    fill_in "Age", with: @student.age
    fill_in "Birthday", with: @student.birthday
    fill_in "Career", with: @student.career
    fill_in "Comment", with: @student.comment
    fill_in "Identification", with: @student.identification
    fill_in "Issued in", with: @student.issued_in
    fill_in "Last name", with: @student.last_name
    fill_in "Leader first", with: @student.leader_first
    fill_in "Leader second", with: @student.leader_second
    fill_in "Link data", with: @student.link_data
    fill_in "Link university", with: @student.link_university
    fill_in "Mail", with: @student.mail
    fill_in "Mail 2", with: @student.mail_2
    fill_in "Name", with: @student.name
    fill_in "Phone", with: @student.phone
    fill_in "Phone 2", with: @student.phone_2
    fill_in "Score", with: @student.score
    fill_in "Semester", with: @student.semester
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Address", with: @student.address
    fill_in "Age", with: @student.age
    fill_in "Birthday", with: @student.birthday
    fill_in "Career", with: @student.career
    fill_in "Comment", with: @student.comment
    fill_in "Identification", with: @student.identification
    fill_in "Issued in", with: @student.issued_in
    fill_in "Last name", with: @student.last_name
    fill_in "Leader first", with: @student.leader_first
    fill_in "Leader second", with: @student.leader_second
    fill_in "Link data", with: @student.link_data
    fill_in "Link university", with: @student.link_university
    fill_in "Mail", with: @student.mail
    fill_in "Mail 2", with: @student.mail_2
    fill_in "Name", with: @student.name
    fill_in "Phone", with: @student.phone
    fill_in "Phone 2", with: @student.phone_2
    fill_in "Score", with: @student.score
    fill_in "Semester", with: @student.semester
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
