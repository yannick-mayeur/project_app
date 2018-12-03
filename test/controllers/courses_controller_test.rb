require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = dusers(:three)
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
    sign_in(@user)
    get new_course_url
    assert_response :success
  end

  test "redirect when new and not logged in" do
    get new_course_url
    assert_redirected_to new_duser_session_path
    follow_redirect!
    assert_not flash.empty?
  end

  test "should create course" do
    sign_in(@user)
    assert_difference('Course.count') do
      post courses_path, params: { course: { name: "foobar", description: "foobar" } }
    end
    assert_redirected_to courses_path
  end

  test "should get edit" do
    sign_in(@user)
    course = Course.first
    get edit_course_path(course)
    assert_response :success
  end

  test "should not get edit because not logged in" do
    course = Course.first
    get edit_course_path(course)
    assert_redirected_to new_duser_session_path
  end

  test "should update course" do
    sign_in(@user)
    course = Course.first
    patch course_path(course), params: { course: { name: "updated" } }
    assert_redirected_to courses_path
    course.reload
    assert_equal "updated", course.name
  end

  test "should destroy course" do
    sign_in(@user)
    course = Course.first
    assert_difference('Course.count', -1) do
      delete course_path(course)
    end
    assert_redirected_to courses_path
  end
end
