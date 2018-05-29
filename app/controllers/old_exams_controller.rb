class OldExamsController < ApplicationController
  def show
    @old_exam = OldExam.find(params[:id])
  end

  def new
    @old_exam = OldExam.new(course_id: params[:course_id])
  end

  def create
    @old_exam = OldExam.new(user_params)
    if @old_exam.save
      flash[:success] = "Exam created!"
      redirect_to root_path
    else
      render 'new'
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
    params.require(:old_exam).permit(:title, :file, :course_id)
  end
end
