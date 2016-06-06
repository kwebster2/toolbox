class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    begin
      @user = User.omniauth_login(request.env["omniauth.auth"])
      session[:user_id] = @user.id 
      flash[:success] = "Welcome, #{@user.first_name}!"
    rescue
      flash[:warning] = "There was an error trying to authenticate. Please ensure your credentials are correct."
    end
    redirect_to cohorts_path
  end

  def destroy
    session.delete :user_id
    flash[:message] = "Successfully logged out."
    redirect_to root_path
  end
end
