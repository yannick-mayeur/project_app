class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(user_params)
    if @course.save
      flash[:success] = "Successful sign up!"
      redirect_to courses_path
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:course).permit(:name, :description)
  end
end
