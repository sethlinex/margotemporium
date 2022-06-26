require "rails_helper"

RSpec.feature "Margot posts can be seen on the homepage" do
    scenario "and clicking the image or name will take you to the post" do
        visit "/"

        click_link "New Margot"

        fill_in "Name", with: "Chi Ball"
        attach_file("Image", "spec/fixtures/logo.jpg")
        click_button "Upload this Margot"
        expect(page). to have_content "This Margot has been added!"

        click_link "Return to the Emporium..."
        
        within(".posts") do
            expect(page).to have_content "Chi Ball"
            expect(page).to have_css("img[src*='logo.jpg']")
        end
    end
end
