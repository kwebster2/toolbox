class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show    
  end

  private
  def set_user
    @user = current_user
    @resource = Resource.new
  end
end
