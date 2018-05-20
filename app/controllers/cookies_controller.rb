class CookiesController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:cookie][:email].downcase)
    if user && user.authenticate(params[:cookie][:password])
      # Log the user in and redirect to the user's show page.
      remember user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    # to avoid an error for a user in a second window
    log_out if logged_in?
    redirect_to root_url
  end

end
