class BandsController < ApplicationController

  def index
    @bands = Band.all

  end

  def new
    @band = Band.new
  end

  def create

    Band.create(name: params[:band][:name])
    redirect_to bands_path
  end

  def show
    
    @band = Band.find(params[:id])

  end
end