class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    user = User.find_by(id: session[:user_id])
    performer = Performer.find_by(id: session[:performer_id])
    if user
      @current_user ||= user
    else
      @curent_user ||= performer
    end
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to login_path unless current_user
  end
end
