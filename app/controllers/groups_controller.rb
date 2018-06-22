class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
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

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(user_params)
      flash[:success] = "Successful edit!"
      redirect_to groups_path
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:group).permit(:name)
  end
end
