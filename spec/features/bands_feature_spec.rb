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
        fill_in :name, with: @band
        click_button "submit"
        current_path.should == bands_path
        page.should have_content(@band)
      end
    end
  end
end
  