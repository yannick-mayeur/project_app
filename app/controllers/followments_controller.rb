class FollowmentsController < ApplicationController
  before_action :duser_signed_in?

  def create
    @course = Course.find(params[:course_id])
    if current_duser.courses.exists?(@course.id)
      redirect_to courses_path
    else
      current_duser.courses<<@course
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def destroy
    @course = Followment.find(params[:id]).course
    current_duser.courses.delete(@course)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

end
