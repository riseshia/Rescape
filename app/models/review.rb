# Review
class Review < ActiveRecord::Base
  belongs_to :user

  LEVEL = {
    "전체공개" => 0,
    "비공개" => 1
  }.freeze

  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 20_000 }
  validates :content_title, presence: true, length: { maximum: 200 }
  validates :level, presence: true, inclusion: { in: LEVEL.values }

  scope :recent, -> (n) { order(id: :desc).limit(n) }

  def editable?(user)
    user_id == user.id
  end

  def display_created_at
    created_at.strftime("%Y-%m-%d")
  end
end
