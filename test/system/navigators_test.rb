require "application_system_test_case"

class NavigatorsTest < ApplicationSystemTestCase
  setup do
    @navigator = navigators(:one)
  end

  test "visiting the index" do
    visit navigators_url
    assert_selector "h1", text: "Navigators"
  end

  test "creating a Navigator" do
    visit navigators_url
    click_on "New Navigator"

    click_on "Create Navigator"

    assert_text "Navigator was successfully created"
    click_on "Back"
  end

  test "updating a Navigator" do
    visit navigators_url
    click_on "Edit", match: :first

    click_on "Update Navigator"

    assert_text "Navigator was successfully updated"
    click_on "Back"
  end

  test "destroying a Navigator" do
    visit navigators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Navigator was successfully destroyed"
  end
end
