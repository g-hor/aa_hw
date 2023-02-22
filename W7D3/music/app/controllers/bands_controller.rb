class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
    render :index
  end


  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:message] = "Your band, #{@band.name} has been created! Welcome :^)"
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end


  def new
    @band = Band.new
    render :new
  end


  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end


  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end


  def update
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      flash[:message] = "Your band has been successfully edited!"
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
    end
  end


  def destroy
    @band = Band.find_by(id: params[:id])

    if @band.destroy
      flash[:message] = "Good bye forever, #{@band.name} :^("
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end


  def set_band

  end


  private
  def band_params
    params.require(:band).permit(:name)
  end
end
