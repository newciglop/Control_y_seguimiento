require "application_system_test_case"

class RegisterBooksTest < ApplicationSystemTestCase
  setup do
    @register_book = register_books(:one)
  end

  test "visiting the index" do
    visit register_books_url
    assert_selector "h1", text: "Register Books"
  end

  test "creating a Register book" do
    visit register_books_url
    click_on "New Register Book"

    fill_in "Admin control", with: @register_book.admin_control_id
    fill_in "Create user", with: @register_book.create_user
    fill_in "Destroy user", with: @register_book.destroy_user
    fill_in "Offer", with: @register_book.offer_id
    fill_in "Time destroy", with: @register_book.time_destroy
    fill_in "Update user", with: @register_book.update_user
    click_on "Create Register book"

    assert_text "Register book was successfully created"
    click_on "Back"
  end

  test "updating a Register book" do
    visit register_books_url
    click_on "Edit", match: :first

    fill_in "Admin control", with: @register_book.admin_control_id
    fill_in "Create user", with: @register_book.create_user
    fill_in "Destroy user", with: @register_book.destroy_user
    fill_in "Offer", with: @register_book.offer_id
    fill_in "Time destroy", with: @register_book.time_destroy
    fill_in "Update user", with: @register_book.update_user
    click_on "Update Register book"

    assert_text "Register book was successfully updated"
    click_on "Back"
  end

  test "destroying a Register book" do
    visit register_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Register book was successfully destroyed"
  end
end
