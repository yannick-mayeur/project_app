class StaticPagesController < ApplicationController
  def home
    if duser_signed_in?
      @user ||= current_duser
      @courses = @user.courses
      @courses = @user.courses.paginate(page: params[:page], per_page: 10)
    end
  end

  def about
  end
end
