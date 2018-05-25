class ApplicationController < ActionController::Base
  include CookiesHelper

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms an admin user.
  def admin_user
    flash[:danger] = "YOU ARE NOT AN ADMIN"
    redirect_to(root_url) unless current_user.admin?
  end
end
