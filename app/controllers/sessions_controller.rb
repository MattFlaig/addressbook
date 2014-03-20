class SessionsController < ApplicationController
	def new
	end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are logged in now!"
      redirect_to contacts_path
    else
      flash[:danger] = "Something is wrong with either your username or password!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out successfully."
    redirect_to root_path
  end
end

