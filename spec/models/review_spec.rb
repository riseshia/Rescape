require "rails_helper"

RSpec.describe Review, type: :model do
  it { expect belong_to(:user) }
  it { expect validate_presence_of(:title) }
  it { expect validate_length_of(:title).is_at_most(200) }
  it { expect validate_presence_of(:body) }
  it { expect validate_length_of(:body).is_at_most(20_000) }
  it { expect validate_presence_of(:content_title) }
  it { expect validate_length_of(:content_title).is_at_most(200) }
  it { expect validate_presence_of(:level) }
  it { expect validate_inclusion_of(:level).in_array(Review::LEVEL.values) }

  describe "#editable?" do
    it "will return false" do
      user = create(:user)
      review = create(:review)
      expect(review.editable?(user)).to be false
    end

    it "will return true" do
      review = create(:review)
      user = review.user
      expect(review.editable?(user)).to be true
    end
  end
end
