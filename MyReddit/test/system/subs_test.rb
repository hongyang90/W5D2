require "application_system_test_case"

class SubsTest < ApplicationSystemTestCase
  setup do
    @sub = subs(:one)
  end

  test "visiting the index" do
    visit subs_url
    assert_selector "h1", text: "Subs"
  end

  test "creating a Sub" do
    visit subs_url
    click_on "New Sub"

    click_on "Create Sub"

    assert_text "Sub was successfully created"
    click_on "Back"
  end

  test "updating a Sub" do
    visit subs_url
    click_on "Edit", match: :first

    click_on "Update Sub"

    assert_text "Sub was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub" do
    visit subs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub was successfully destroyed"
  end
end
