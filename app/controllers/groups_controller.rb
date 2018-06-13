class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(user_params)
    if @group.save
      flash[:success] = "Course created!"
      redirect_to groups_path
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:group).permit(:name)
  end
end
