require "rails_helper"

RSpec.describe ChurchServicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/church_services").to route_to("church_services#index")
    end

    it "routes to #new" do
      expect(get: "/church_services/new").to route_to("church_services#new")
    end

    it "routes to #show" do
      expect(get: "/church_services/1").to route_to("church_services#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/church_services/1/edit").to route_to("church_services#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/church_services").to route_to("church_services#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/church_services/1").to route_to("church_services#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/church_services/1").to route_to("church_services#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/church_services/1").to route_to("church_services#destroy", id: "1")
    end
  end
end
