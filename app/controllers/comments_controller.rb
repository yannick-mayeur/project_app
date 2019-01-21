class CommentsController < ApplicationController
  before_action :authenticate_duser!
  before_action :admin_duser!, only: :destroy

  def create
    @comment = current_duser.comments.build(user_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to old_exam_path(@comment.old_exam_id)
    else
      flash[:danger] = "ERROR!"
      redirect_to old_exam_path(@comment.old_exam_id)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    id = comment.old_exam.id
    comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to old_exam_path(id)
  end


  private

  def user_params
    params.require(:comment).permit(:content, :old_exam_id, :image)
  end
end
