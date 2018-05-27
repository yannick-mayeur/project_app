require 'test_helper'

class OldExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get old_exams_new_url
    assert_response :success
  end

end
