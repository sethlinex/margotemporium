FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "test#{n}@example.com" }
        sequence(:username) { |u| "testaccount#{u}" }
        password { "password" }
    end
end