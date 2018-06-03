require 'test_helper'

class OldExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_old_exam_url
    assert_response :success
  end

end
