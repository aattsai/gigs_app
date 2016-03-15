class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:warning] = user.errors.full_messages.join(". ")
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def show
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :full_name, :password, :bio)
  end

end