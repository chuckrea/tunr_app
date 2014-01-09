require 'spec_helper'

describe BandMembershipsController do
  describe "creating a band membership" do
    describe "starting on a new membership page" do
      before do
        @tom_morello = Musician.create name: "Tom Morello"
        @rage = Band.create name: "Rage Against The Machine"
        visit new_band_membership_path
      end
      it "can create band membership" do
        select @tom_morello.name, {:from => "musician_id"}
        select @rage.name, {:from => "band_id"}

        click_button "submit"

        @tom_morello.bands.should include @rage
      end
    end
  end
  describe "Given a Band and a Musician relationship" do
    before do
      @band = Band.create name: "Rage Against The Machine" 
      @musician = Musician.create name: "Tom Morello"
      BandMembership.create({band: @band, musician: @musician})
    end
    describe "starting on a band's show page" do
      before do
        visit band_path(@band)
      end
      it "shows a Band's name and its musicians" do
        page.should have_content(@band.name)
        page.should have_content(@musician.name)
      end
    end
    describe "starting at a musician's show page" do
      before do
        visit musician_path(@musician)
      end
      it "shows the musician and the bands they belong to" do
        page.should have_content(@musician.name)
        page.should have_content(@band.name)
      end
    end
  end
end