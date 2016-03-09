class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
  end

  def create
    if params[:checkbox]
      if Performer.performer_login(params)
        session[:performer_id] = performer.id
        redirect_to root_path
      else
        flash.now[:warning] = "Login failed. Please Try Again."
        render :new
      end
      # performer = Performer.find_by(username: params[:username])
      # if performer && performer.authenticate(params[:password])
      #   session[:performer_id] = performer.id
      #   redirect_to root_path
      # else
      #   flash.now[:warning] = "Login failed. Please Try Again."
      #   render :new
      # end
    else
      if User.user_login(params)
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash.now[:warning] = "Login failed. Please Try Again."
        render :new
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end