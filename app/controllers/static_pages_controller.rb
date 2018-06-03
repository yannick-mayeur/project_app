class StaticPagesController < ApplicationController
  def home
    @user ||= current_user
    @courses = @user.courses
    @courses = @user.courses.paginate(page: params[:page], per_page: 10)
  end

  def about
  end
end
