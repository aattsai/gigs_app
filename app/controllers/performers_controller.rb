class PerformersController < ApplicationController

  def new
  end

  def create
    performer = Performer.new(performer_params)
    if performer.save
      session[:performer_id] = performer.id
      redirect_to root_path
    else
      flash[:warning] = performer.errors.full_messages.join(". ")
      redirect_to new_performer_path
    end
  end

  def show
  end

  private
  def performer_params
    params.require(:performer).permit(:username, :email, :full_name, :password)
  end

end