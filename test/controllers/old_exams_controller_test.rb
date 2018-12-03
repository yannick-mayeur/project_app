require 'test_helper'

class OldExamsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get new" do
    @user = dusers(:three)
    sign_in(@user)
    get new_old_exam_url
    assert_response :success
  end

end
