require "application_system_test_case"

class ControllerStudentsTest < ApplicationSystemTestCase
  setup do
    @controller_student = controller_students(:one)
  end

  test "visiting the index" do
    visit controller_students_url
    assert_selector "h1", text: "Controller Students"
  end

  test "creating a Controller student" do
    visit controller_students_url
    click_on "New Controller Student"

    click_on "Create Controller student"

    assert_text "Controller student was successfully created"
    click_on "Back"
  end

  test "updating a Controller student" do
    visit controller_students_url
    click_on "Edit", match: :first

    click_on "Update Controller student"

    assert_text "Controller student was successfully updated"
    click_on "Back"
  end

  test "destroying a Controller student" do
    visit controller_students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Controller student was successfully destroyed"
  end
end
