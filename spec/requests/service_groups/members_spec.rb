require 'rails_helper'

RSpec.describe "ServiceGroups::Members", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/service_groups/members/index"
      expect(response).to have_http_status(:success)
    end
  end

end
