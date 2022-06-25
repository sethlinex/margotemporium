require "rails_helper"

RSpec.feature "users can upload images of Margot" do
    scenario "with only a name and image" do
        visit "/"

        click_link "New Margot"

        fill_in "Name", with: "Chi Ball"
        attach_file("Image", "spec/fixtures/logo.jpg")
        click_button "Upload this Margot"

        expect(page). to have_content "This Margot has been added!"

        within(".post") do
            expect(page).to have_content "Chi Ball"
            expect(page).to have_css("img[src*='logo.jpg']")
        end
    end
end