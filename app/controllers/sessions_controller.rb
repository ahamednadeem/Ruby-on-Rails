
class SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # If the user is authenticated, create a session
      session[:user_id] = user.id
      redirect_to friends_path, notice: "Logged in successfully!"
    else
      # If authentication fails, display an error message and send a notice
      flash.now[:notice] = "Invalid email or password. Please try again."
      render 'new'
    end
    
    
  end

  def destroy
    # Log out by clearing the session
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
