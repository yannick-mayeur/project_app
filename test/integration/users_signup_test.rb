require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid form submission" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation"
    assert_select "div.alert"
  end

  test "valid form submission" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count' do
      post signup_path, params: { user: { name:  "foobar",
                                          email: "foo.bar@umontpellier.fr",
                                          password:              "foobar",
                                          password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template root_path
    assert_not flash.empty?
    assert_select "div.alert-info"
  end

end
