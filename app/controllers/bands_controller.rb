class BandsController < ApplicationController

  def new
  end

  def create
    @error_message = ''
    band = performer.band.new(name: params[:band][:name], bio: params[:band][:bio])
    if band.save
      redirect_to band_path(band.id)
    else
      @error_mesage = band.errors.full_message
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end
end