require "rails_helper"

RSpec.describe User, type: :model do
  it { expect validate_uniqueness_of(:username) }
  it { expect validate_uniqueness_of(:email) }
  it { expect have_many(:reviews) }
end
