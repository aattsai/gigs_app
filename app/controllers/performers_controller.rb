class PerformersController < ApplicationController

  def index
    @performers = Performer.all
  end

  def new
  end

  def create
    performer = Performer.new(performer_params)
    performer.avatar = params[:avatar]
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
    @performer = Performer.find(params[:id])
    @youtube_id = get_youtube_id
  end

  # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
  def get_youtube_id
    if @performer.youtube[/youtu\.be\/([^\?]*)/]
      youtube = $1
    else
      @performer.youtube[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube = $5
    end
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
    params.require(:performer).permit(:email, :location, :full_name, :password, :affiliates, :instruments, :bio, :degree, :youtube, :avatar)
  end

end