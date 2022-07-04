require "rails_helper"

RSpec.feature "Admins can remove comments from Margot posts" do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }

    before do
        login_as(user)
    end

    scenario "by clicking a link" do
        visit post_path(post)

        within(".comments") do
            fill_in "Text", with: "Added a comment!"
            click_button "Create Comment"
            click_button "Delete Comment"
        end

        expect(page).to have_content "Comment removed successfully."

    end
end