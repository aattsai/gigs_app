class PerformersController < ApplicationController

  def index
    @performers = Performer.all
  end

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

  def edit
    @performer = Performer.find(params[:id])
  end

  def show
  end

  def update
    performer = Performer.find(params[:id])
    if performer.update_attributes(performer_params)
      redirect_to performer_path(current_user.id)
    else
      render :edit
    end
  end

  private
  def performer_params
    params.require(:performer).permit(:email, :location, :full_name, :password, :affiliates, :instruments, :bio)
  end

end