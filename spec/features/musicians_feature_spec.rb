require 'spec_helper'

describe MusiciansController do
  describe "Given a musician name" do
    before do
      @name = "Diana Ross"
    end
    describe "Starting on the new musician page" do
      before do
        visit new_musician_path
      end
      it "creates a musician from a form" do
        fill_in :name, with: @name
        click_button "submit"
        current_path.should == musicians_path
        page.should have_content(@name)
      end
    end
  end 
  describe "Given a musician" do
      before do
        @musician = Musician.create name: "Tom Morello"
      end
      describe "Starting on a musician's show page" do
        before do
          visit musician_path(@musician)
        end
        it "display's that musician's information" do
          page.should have_content(@musician.name)
        end
      end
    end
end