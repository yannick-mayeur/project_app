require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", courses_path
    assert_select "a[href=?]", login_path
  end

  test "layout links logged in" do
    @user = users(:foobar)
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", edit_user_path(@user)
  end

  test "home links" do
    get root_path
    assert_select "a[href=?]", signup_path
  end

end
