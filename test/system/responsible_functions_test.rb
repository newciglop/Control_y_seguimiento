require "application_system_test_case"

class ResponsibleFunctionsTest < ApplicationSystemTestCase
  setup do
    @responsible_function = responsible_functions(:one)
  end

  test "visiting the index" do
    visit responsible_functions_url
    assert_selector "h1", text: "Responsible Functions"
  end

  test "creating a Responsible function" do
    visit responsible_functions_url
    click_on "New Responsible Function"

    click_on "Create Responsible function"

    assert_text "Responsible function was successfully created"
    click_on "Back"
  end

  test "updating a Responsible function" do
    visit responsible_functions_url
    click_on "Edit", match: :first

    click_on "Update Responsible function"

    assert_text "Responsible function was successfully updated"
    click_on "Back"
  end

  test "destroying a Responsible function" do
    visit responsible_functions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Responsible function was successfully destroyed"
  end
end
