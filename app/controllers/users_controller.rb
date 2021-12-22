class UsersController < ApplicationController
  def index
    if current_user
      @users = User.all
    else
      redirect_to user_session_path
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
