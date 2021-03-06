require 'spec_helper'

describe BandsController do
  describe "Given a band" do
    before do
      @band = "Metallica"
    end
    describe "Starting on a new band page" do
      before do
        visit new_band_path
      end
      it "makes a new band from a form" do
        fill_in :band_name, with: @band
        click_button "submit"
        current_path.should == bands_path
        page.should have_content(@band)
      end
    end
  end
  describe "Given a Band" do
        before do
            @band = Band.create(name: "Jefferson Starship")
        end
        describe "when we visit the edit page" do
            before do
                visit edit_band_path(@band)
            end
            it "should have the band name" do
                find_field("band_name").value.should == @band.name
            end
            describe "when we fill in the form" do
                before do
                   fill_in "band_name", with: "Starship"
                   click_button "submit"
                end
                it "should take us to the show page" do
                   current_path.should == band_path(@band)
                end
                it "should have the new name" do
                    page.should have_content("Starship")
                end
            end
        end
        describe "when we visit the index page" do
            before do
                visit bands_path
            end
            describe "when we click the delete button" do
                before do
                    within "tr.band_#{@band.id}" do
                       click_button "DELETE"
                    end
                end
                it "should leave us on the index page" do
                   current_path.should == bands_path
                end
                it "should no longer have the band" do
                    page.should_not have_content(@band.name)
                end
            end
        end
      end
end
  