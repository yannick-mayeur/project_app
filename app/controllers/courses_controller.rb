class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:new,:edit, :update, :destroy]
  before_action :admin_user, only: [:new,:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(user_params)
    if @course.save
      flash[:success] = "Course created!"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to courses_path
  end


  private

  def user_params
    params.require(:course).permit(:name, :description)
  end
end
