FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
