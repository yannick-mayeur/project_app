class CoursesController < ApplicationController
  before_action :authenticate_duser!, only: [:new, :edit, :update, :destroy]

  def index
    @courses = Course.search(params[:search]).paginate(page: params[:page], per_page: 10)
  end

  def show
    @course = Course.find(params[:id])
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

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(user_params)
      flash[:success] = "Successful edit!"
      redirect_to courses_path
    else
      render 'edit'
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
