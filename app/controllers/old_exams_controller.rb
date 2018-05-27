class OldExamsController < ApplicationController
  def show
    @old_exam = OldExam.find(params[:id])
  end

  def new
    @old_exam = OldExam.new
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


  private

  def user_params
    params.require(:old_exam).permit(:title, :file)
  end
end
