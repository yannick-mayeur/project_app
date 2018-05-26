class FollowmentsController < ApplicationController
  before_action :logged_in_user

  def create
    @course = Course.find(params[:course_id])
    if current_user.courses.exists?(@course.id)
      redirect_to courses_path
    else
      current_user.courses<<@course
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def destroy
    @course = Followment.find(params[:id]).course
    current_user.courses.delete(@course)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

end
