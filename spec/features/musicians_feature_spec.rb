require 'spec_helper'

describe MusiciansController do
  describe "Given a musician name" do
    before do
      @musician = Musician.new name: "Diana Ross"
    end
    describe "Starting on the new musician page" do
      before do
        visit new_musician_path
      end
      it "creates a musician from a form" do
        fill_in :musician_name, with: @name
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
      describe "when we visit the edit page" do
        before do
          visit edit_musician_path(@musician)
        end
        it "should have the musician name in the form" do
          find_field("musician_name").value.should == @musician.name
        end
        describe "when we fill in the form" do
          before do
            fill_in "musician_name", with: "Chris Cornell"
            click_button "submit"
          end
          it "should take us to the show page" do
            current_path.should == musician_path(@musician)
          end
          it "should have the new name" do
            page.should have_content("Cornell")
          end
        end
      end
      describe "when we visit the index page" do
        before do
          visit musicians_path
        end
        describe "when we click the delete button" do
          before do
            within "tr.musician_#{@musician.id}" do
              click_button "DELETE"
            end
          end
          it "should leave us on the index page" do
            current_path.should == musicians_path
          end
          it "should no longer have the musician" do
            page.should_not have_content(@musician.name)
          end

        end
      end
    end
end