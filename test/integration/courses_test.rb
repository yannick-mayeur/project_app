require 'test_helper'

class CoursesTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:foobar)
  end

  test "index page when logged in" do
    log_in_as(@user)
    get courses_path
    assert_select 'div.card-body' do
      assert_select 'a', count: Course.count
    end
  end

  test "invalid new courses" do
    log_in_as(@user)
    get new_course_path
    assert_select 'form[action="/courses"]'
    assert_no_difference 'Course.count' do
      post courses_path, params: { course: { name: "",
                                             description: "" } }
    end
    assert_template 'courses/new'
    assert_select "div#error_explanation"
    assert_select "div.alert"
  end

  test "valid new courses" do
    log_in_as(@user)
    get new_course_path
    assert_select 'form[action="/courses"]'
    assert_difference 'Course.count' do
      post courses_path, params: { course: { name: "Foobar",
                                             description: "Lorem ipsum..." } }
    end
    follow_redirect!
    assert_template 'courses/index'
    assert_not flash.empty?
    assert_select "div.alert-success"
  end
end
