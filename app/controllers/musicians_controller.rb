class MusiciansController < ApplicationController

  def index
    @musicians = Musician.all
  end

  def new

  end

  def create
    name = params[:name]
    Musician.create(name: name)

    redirect_to musicians_path
  end

  def show

    @musician = Musician.find(params[:id])
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update

    musician = Musician.find(params[:id])
    musician.name = params[:musician][:name]
    musician.savegit 
    redirect_to musician_path(musician)
  end

end