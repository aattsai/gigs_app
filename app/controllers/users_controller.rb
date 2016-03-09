class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      debugger
      redirect_to root_path
    else
      flash[:warning] = user.errors.full_messages.join(". ")
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :full_name, :password)
  end

end