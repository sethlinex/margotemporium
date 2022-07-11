require "rails_helper"

RSpec.feature "Users can vote on Margot posts" do
    let(:user) { FactoryBot.create(:user) }
    let(:post_1) { FactoryBot.create(:post, name: "Chi Ball") }
    let(:post_2) { FactoryBot.create(:post, name: "Dragonmode") }


    before do
        login_as(user)
    end

    scenario "by clicking a link" do
        visit post_path(post_1)

        click_link "Vote"

        within(".votes") do
            expect(page).to have_content "1"
        end
    end

    scenario "posts with the most votes show up at the top" do
        visit post_path(post_1)

        click_link "Vote"

        visit "/"

        within(".hof") do
            expect(page).to have_content "Chi Ball"
            expect(page).to have_content "with 1 like!"
            expect(page).not_to have_content "Dragonmode"
        end
    end
end