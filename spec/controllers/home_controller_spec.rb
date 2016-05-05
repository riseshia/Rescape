require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      sign_in create(:user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
