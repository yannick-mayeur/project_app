require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post signup_url, params: { user: { name: "foobar",
                                         email: "foo.bar@etu.umontpellier.fr",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
    assert_redirected_to root_path
  end

  test "should update user" do
    user = User.first
    # We have to be logged in to be able to update user
    log_in_as(user)
    patch user_path(user), params: { user: { name: "updated" } }
    assert_redirected_to root_path
    user.reload
    assert_equal "updated", user.name
  end

end
