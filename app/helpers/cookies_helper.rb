module CookiesHelper

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    user_id = cookies.signed[:user_id]
    user = User.find_by(id: user_id)
    if user && user.authenticated?(cookies[:remember_token])
      @current_user = user
    end
  end

  def current_user?(user)
    user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgers a user
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    @current_user = nil
  end
end
