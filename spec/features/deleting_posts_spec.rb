require "rails_helper"

RSpec.feature "You can delete existing Margots" do
    scenario "successfully" do
        FactoryBot.create(:post)

        visit "/"
        click_link "Example Margot"
        click_link "Remove this Margot"

        expect(page).to have_content "Margot successfully removed."
        expect(page.current_url).to eq posts_url
        expect(page).to have_no_content "Example Margot"
    end
end