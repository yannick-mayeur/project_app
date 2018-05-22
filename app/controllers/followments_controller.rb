class FollowmentsController < ApplicationController
  before_action :logged_in_user

  def create
    course = Course.find_by_id(params[:course_id])
    if current_user.courses.exists?(course.id)
      # nothing
    else
      current_user.courses<<course
    end
  end
end
