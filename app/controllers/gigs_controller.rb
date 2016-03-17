class GigsController < ApplicationController

  def index
    @gigs = Gig.all
  end

  def new
  end

  def create
    user = User.find(session[:user_id])
    gig = user.gigs.new(gig_params)
    zip = ZipCodes.identify(gig.zipcode.to_s)
    gig.update_attributes(state: zip[:state_code], city: zip[:city])
    if gig.save
      redirect_to gig_path(gig.id)
    else
      render :new
    end
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def update
    gig = Gig.find(params[:id])

    if gig.update_attributes(gig_params)
      zip = ZipCodes.identify(gig.zipcode.to_s)
      gig.update_attributes(state: zip[:state_code], city: zip[:city])
      redirect_to gig_path(gig.id)
    else
      render :edit
    end
  end

  def destroy
    gig = Gig.find(params[:id])
    if gig.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def gig_params
    params.require(:gig).permit(:title, :description, :venue, :address, :zipcode, :date, :time, :price)
  end

end