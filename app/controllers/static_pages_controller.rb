class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user ||= current_user
      @courses = @user.courses
      @courses = @user.courses.paginate(page: params[:page], per_page: 10)
    end
  end

  def about
  end
end
