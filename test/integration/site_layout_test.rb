require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", courses_path
    assert_select "a[href=?]", new_duser_session_path
  end

  test "layout links logged in" do
    @user = dusers(:one)
    sign_in(@user)
    get root_path
    assert_select "a[href=?]", destroy_duser_session_path
    assert_select "a[href=?]", edit_duser_registration_path
  end

  test "home links" do
    get root_path
    assert_select "a[href=?]", new_duser_registration_path
  end

end
