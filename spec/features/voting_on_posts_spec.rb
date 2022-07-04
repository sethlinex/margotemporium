require "rails_helper"

RSpec.feature "Users can comment on Margot posts" do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }

    before do
        login_as(user)
    end

    scenario "with valid attributes" do
        visit post_path(post)

        click_link "Vote"

        within(".votes") do
            expect(page).to have_content "1"
        end
    end
end