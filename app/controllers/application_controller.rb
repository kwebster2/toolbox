class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private
  def require_login
    if !session[:user_id]
      flash[:warning] = "You are not logged in"
      redirect_to root_path
    end
  end
end
