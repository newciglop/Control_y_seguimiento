require "application_system_test_case"

class StatesStudentsTest < ApplicationSystemTestCase
  setup do
    @process = states_students(:one)
  end

  test "visiting the index" do
    visit processes_url
    assert_selector "h1", text: "States Students"
  end

  test "creating a States student" do
    visit processes_url
    click_on "New States Student"

    check "Enable" if @process.enable
    fill_in "Name", with: @process.name
    click_on "Create States student"

    assert_text "States student was successfully created"
    click_on "Back"
  end

  test "updating a States student" do
    visit processes_url
    click_on "Edit", match: :first

    check "Enable" if @process.enable
    fill_in "Name", with: @process.name
    click_on "Update States student"

    assert_text "States student was successfully updated"
    click_on "Back"
  end

  test "destroying a States student" do
    visit processes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "States student was successfully destroyed"
  end
end
