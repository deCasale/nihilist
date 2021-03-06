class Admin::SessionsController < ApplicationController
  layout "login"
  
  def new
  end
  
  def create
    user = Admin::User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to admin_comics_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password!"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Goodbye and thanks for all the fish!"
  end
end
