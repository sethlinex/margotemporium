require "rails_helper"

RSpec.feature "You can edit existing Margots" do
    scenario "to change the name (for now)" do
        FactoryBot.create(:post)

        visit "/"
        click_link "Example Margot"

        within(".post") do
            expect(page).to have_content "Example Margot"
            expect(page).to have_css("img[src*='logo.jpg']")
        end

        click_link "Edit this Margot"
        fill_in "Name", with: "Ball of Chi"
        click_button "Update"

        expect(page).to have_content "This Margot's name has been changed!"
        expect(page).to have_content "Ball of Chi"
    end
end