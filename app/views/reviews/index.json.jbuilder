json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :body, :content_title, :content_episode, :user_id, :level
  json.url review_url(review, format: :json)
end
