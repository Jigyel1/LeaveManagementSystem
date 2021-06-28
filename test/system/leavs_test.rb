require "application_system_test_case"

class LeavsTest < ApplicationSystemTestCase
  setup do
    @leav = leavs(:one)
  end

  test "visiting the index" do
    visit leavs_url
    assert_selector "h1", text: "Leavs"
  end

  test "creating a Leav" do
    visit leavs_url
    click_on "New Leav"

    fill_in "Duration", with: @leav.duration
    fill_in "End date", with: @leav.end_date
    fill_in "Feedback", with: @leav.feedback
    fill_in "Leave type", with: @leav.leave_type
    fill_in "Reason", with: @leav.reason
    fill_in "Start date", with: @leav.start_date
    fill_in "Status", with: @leav.status
    click_on "Create Leav"

    assert_text "Leav was successfully created"
    click_on "Back"
  end

  test "updating a Leav" do
    visit leavs_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @leav.duration
    fill_in "End date", with: @leav.end_date
    fill_in "Feedback", with: @leav.feedback
    fill_in "Leave type", with: @leav.leave_type
    fill_in "Reason", with: @leav.reason
    fill_in "Start date", with: @leav.start_date
    fill_in "Status", with: @leav.status
    click_on "Update Leav"

    assert_text "Leav was successfully updated"
    click_on "Back"
  end

  test "destroying a Leav" do
    visit leavs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leav was successfully destroyed"
  end
end
