require "google/cloud/storage"

class OldExamsController < ApplicationController
  before_action :authenticate_duser!, only: [:new, :edit, :update, :destroy]
  before_action :admin_duser!, only: [:new, :edit, :update, :destroy]

  def show
    @old_exam = OldExam.find(params[:id])
    @comments = @old_exam.comments.paginate(page: params[:page], per_page: 10)
  end

  def new
    @old_exam = OldExam.new(course_id: params[:course_id])
  end

  def create
    @old_exam = OldExam.new(user_params)
    @old_exam.file.attach(params[:old_exam][:file])

    if @old_exam.save
      flash[:success] = "Exam created!"
      redirect_to course_path(@old_exam.course_id)
    else
      render 'new'
    end
  end

  def edit
    @old_exam = OldExam.find(params[:id])
  end

  def update
    @old_exam = OldExam.find(params[:id])
    id = @old_exam.course_id
    if @old_exam.update_attributes(user_params)
      flash[:success] = "Successful edit!"
      redirect_to course_path(id)
    else
      render 'edit'
    end
  end

  def destroy
    exam = OldExam.find(params[:id])
    id = exam.course_id
    exam.destroy
    flash[:success] = "Exam deleted"
    redirect_to course_path(id)
  end


  private

  def user_params
    params.require(:old_exam).permit(:title, :course_id)
  end
end
