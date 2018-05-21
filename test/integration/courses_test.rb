require 'test_helper'

class CoursesTest < ActionDispatch::IntegrationTest

  test "invalid new courses" do
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
