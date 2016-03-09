class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
  end

  def create
    if params[:checkbox]
      if Performer.performer_login(params)
        session[:performer_id] = Performer.find_by(username: params[:username]).id
        redirect_to root_path
      else
        error_messages
      end
    else
      if User.user_login(params)
        session[:user_id] = User.find_by(username: params[:username]).id
        redirect_to root_path
      else
        error_messages
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def error_messages
    flash.now[:warning] = "Login failed. Please Try Again."
    render :new
  end

end