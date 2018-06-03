class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @comment = current_user.comments.build(user_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to old_exam_path(@comment.old_exam_id)
    else
      flash[:danger] = "ERROR!"
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:comment).permit(:content, :old_exam_id)
  end
end
