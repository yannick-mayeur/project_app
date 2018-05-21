require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:foobar)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_course_url
    assert_response :success
  end

  test "redirect when new and not logged in" do
    get new_course_url
    assert_redirected_to login_path
    follow_redirect!
    assert_not flash.empty?
  end

end
