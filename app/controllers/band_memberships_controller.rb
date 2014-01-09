class BandMembershipsController < ApplicationController

  def new
    @musicians = Musician.all
    @bands = Band.all
  end

  def create

    band = Band.find(params[:band_id])
    musician = Musician.find(params[:musician_id])

    BandMembership.create({
      musician: musician,
      band: band
      })

    #musician.bands << band
    redirect_to band_path(band)
  end
end