FactoryGirl.define do
  factory :review do
    title "Review Title"
    body "Review body"
    content_title "Content Title"
    content_episode 1
    level 1
    association :user, strategy: :build
  end
end
