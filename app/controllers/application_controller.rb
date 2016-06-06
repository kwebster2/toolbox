class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private
  def require_login
    if !session[:user_id]
      flash[:warning] = "You are not logged in"
      redirect_to root_path
    end
  end
end
