class Review < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 20_000 }
  validates :content_title, presence: true, length: { maximum: 200 }
  validates :level, presence: true
end
