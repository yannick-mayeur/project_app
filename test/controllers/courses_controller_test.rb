require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:yannick)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should show course" do
    course = Course.first
    get course_path(course)
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

  test "should create course" do
    log_in_as(@user)
    assert_difference('Course.count') do
      post courses_path, params: { course: { name: "foobar", description: "foobar", group_id: Group.first.id } }
    end
    assert_redirected_to courses_path
  end

  test "should get edit" do
    log_in_as(@user)
    course = Course.first
    get edit_course_path(course)
    assert_response :success
  end

  test "should not get edit because not logged in" do
    course = Course.first
    get edit_course_path(course)
    assert_redirected_to login_path
  end

  test "should destroy course" do
    log_in_as(@user)
    course = Course.first
    assert_difference('Course.count', -1) do
      delete course_path(course)
    end
    assert_redirected_to courses_path
  end
end
