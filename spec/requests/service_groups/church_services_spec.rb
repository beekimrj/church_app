require 'rails_helper'

RSpec.describe "ServiceGroups::ChurchServices", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/service_groups/church_services/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/service_groups/church_services/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/service_groups/church_services/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/service_groups/church_services/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/service_groups/church_services/update"
      expect(response).to have_http_status(:success)
    end
  end

end
