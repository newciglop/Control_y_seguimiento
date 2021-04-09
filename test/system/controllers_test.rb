require "application_system_test_case"

class ControllersTest < ApplicationSystemTestCase
  setup do
    @controller = controllers(:one)
  end

  test "visiting the index" do
    visit controllers_url
    assert_selector "h1", text: "Controllers"
  end

  test "creating a Controller" do
    visit controllers_url
    click_on "New Controller"

    fill_in "Address", with: @controller.address
    fill_in "Age", with: @controller.age
    fill_in "Birthday", with: @controller.birthday
    fill_in "Career", with: @controller.career
    fill_in "City", with: @controller.city
    fill_in "Comment", with: @controller.comment
    fill_in "Decimal,", with: @controller.decimal,
    fill_in "Identification", with: @controller.identification
    fill_in "Integer,", with: @controller.integer,
    fill_in "Issued in", with: @controller.issued_in
    fill_in "Last name", with: @controller.last_name
    fill_in "Leader first", with: @controller.leader_first
    fill_in "Leader second", with: @controller.leader_second
    fill_in "Link data", with: @controller.link_data
    fill_in "Link university", with: @controller.link_university
    fill_in "Mail", with: @controller.mail
    fill_in "Mail 2", with: @controller.mail_2
    fill_in "Name", with: @controller.name
    fill_in "Phone", with: @controller.phone
    fill_in "Phone 2", with: @controller.phone_2
    fill_in "Score", with: @controller.score
    fill_in "Semester", with: @controller.semester
    fill_in "String", with: @controller.string
    fill_in "String,", with: @controller.string,
    fill_in "Students", with: @controller.students
    click_on "Create Controller"

    assert_text "Controller was successfully created"
    click_on "Back"
  end

  test "updating a Controller" do
    visit controllers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @controller.address
    fill_in "Age", with: @controller.age
    fill_in "Birthday", with: @controller.birthday
    fill_in "Career", with: @controller.career
    fill_in "City", with: @controller.city
    fill_in "Comment", with: @controller.comment
    fill_in "Decimal,", with: @controller.decimal,
    fill_in "Identification", with: @controller.identification
    fill_in "Integer,", with: @controller.integer,
    fill_in "Issued in", with: @controller.issued_in
    fill_in "Last name", with: @controller.last_name
    fill_in "Leader first", with: @controller.leader_first
    fill_in "Leader second", with: @controller.leader_second
    fill_in "Link data", with: @controller.link_data
    fill_in "Link university", with: @controller.link_university
    fill_in "Mail", with: @controller.mail
    fill_in "Mail 2", with: @controller.mail_2
    fill_in "Name", with: @controller.name
    fill_in "Phone", with: @controller.phone
    fill_in "Phone 2", with: @controller.phone_2
    fill_in "Score", with: @controller.score
    fill_in "Semester", with: @controller.semester
    fill_in "String", with: @controller.string
    fill_in "String,", with: @controller.string,
    fill_in "Students", with: @controller.students
    click_on "Update Controller"

    assert_text "Controller was successfully updated"
    click_on "Back"
  end

  test "destroying a Controller" do
    visit controllers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Controller was successfully destroyed"
  end
end
