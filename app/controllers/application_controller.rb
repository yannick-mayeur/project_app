class ApplicationController < ActionController::Base
  def admin_duser!
    if !current_duser.admin?
      flash[:danger] = "YOU ARE NOT AN ADMIN"
      redirect_to root_url
    end
  end
end
