require 'test_helper'

class FollowmentsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = dusers(:one)
  end

  test "successful new follow" do
    sign_in(@user)
    get courses_path
    assert_difference 'Followment.count' do
      post followments_path, params: { course_id: Course.first.id }
    end
  end

  test "unsuccessful new follow because not logged in" do
    get courses_path
    assert_no_difference 'Followment.count' do
      post followments_path, params: { course_id: Course.first.id }
    end
  end

  test "unsuccessful new follow because already follwing" do
    sign_in(@user)
    post followments_path, params: { course_id: Course.first.id }
    get courses_path
    assert_no_difference 'Followment.count' do
      post followments_path, params: { course_id: Course.first.id }
    end
  end
end
