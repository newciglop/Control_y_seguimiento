require "application_system_test_case"

class AdminControlsTest < ApplicationSystemTestCase
  setup do
    @admin_control = admin_controls(:one)
  end

  test "visiting the index" do
    visit admin_controls_url
    assert_selector "h1", text: "Admin Controls"
  end

  test "creating a Admin control" do
    visit admin_controls_url
    click_on "New Admin Control"

    click_on "Create Admin control"

    assert_text "Admin control was successfully created"
    click_on "Back"
  end

  test "updating a Admin control" do
    visit admin_controls_url
    click_on "Edit", match: :first

    click_on "Update Admin control"

    assert_text "Admin control was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin control" do
    visit admin_controls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin control was successfully destroyed"
  end
end
