require "application_system_test_case"

class EngineersTest < ApplicationSystemTestCase
  setup do
    @engineer = engineers(:one)
  end

  test "visiting the index" do
    visit engineers_url
    assert_selector "h1", text: "Engineers"
  end

  test "creating a Engineer" do
    visit engineers_url
    click_on "New Engineer"

    click_on "Create Engineer"

    assert_text "Engineer was successfully created"
    click_on "Back"
  end

  test "updating a Engineer" do
    visit engineers_url
    click_on "Edit", match: :first

    click_on "Update Engineer"

    assert_text "Engineer was successfully updated"
    click_on "Back"
  end

  test "destroying a Engineer" do
    visit engineers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Engineer was successfully destroyed"
  end
end
