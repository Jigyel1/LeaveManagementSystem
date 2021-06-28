require "test_helper"

class LeavsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leav = leavs(:one)
  end

  test "should get index" do
    get leavs_url
    assert_response :success
  end

  test "should get new" do
    get new_leav_url
    assert_response :success
  end

  test "should create leav" do
    assert_difference('Leav.count') do
      post leavs_url, params: { leav: { duration: @leav.duration, end_date: @leav.end_date, feedback: @leav.feedback, leave_type: @leav.leave_type, reason: @leav.reason, start_date: @leav.start_date, status: @leav.status } }
    end

    assert_redirected_to leav_url(Leav.last)
  end

  test "should show leav" do
    get leav_url(@leav)
    assert_response :success
  end

  test "should get edit" do
    get edit_leav_url(@leav)
    assert_response :success
  end

  test "should update leav" do
    patch leav_url(@leav), params: { leav: { duration: @leav.duration, end_date: @leav.end_date, feedback: @leav.feedback, leave_type: @leav.leave_type, reason: @leav.reason, start_date: @leav.start_date, status: @leav.status } }
    assert_redirected_to leav_url(@leav)
  end

  test "should destroy leav" do
    assert_difference('Leav.count', -1) do
      delete leav_url(@leav)
    end

    assert_redirected_to leavs_url
  end
end
