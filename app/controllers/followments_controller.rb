class FollowmentsController < ApplicationController
  before_action :logged_in_user

  def create
    course = Course.find(params[:course_id])
    if current_user.courses.exists?(course.id)
    else
      current_user.courses<<course
      redirect_to courses_path
    end
  end

  def destroy
    course = Followment.find(params[:id]).course
    current_user.courses.delete(course)
    redirect_to courses_path
  end

end
