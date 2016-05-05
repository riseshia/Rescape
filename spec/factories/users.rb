FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "email@email.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
