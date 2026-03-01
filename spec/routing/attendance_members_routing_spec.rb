require "rails_helper"

RSpec.describe AttendanceMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/attendance_members").to route_to("attendance_members#index")
    end

    it "routes to #new" do
      expect(get: "/attendance_members/new").to route_to("attendance_members#new")
    end

    it "routes to #show" do
      expect(get: "/attendance_members/1").to route_to("attendance_members#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/attendance_members/1/edit").to route_to("attendance_members#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/attendance_members").to route_to("attendance_members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/attendance_members/1").to route_to("attendance_members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/attendance_members/1").to route_to("attendance_members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/attendance_members/1").to route_to("attendance_members#destroy", id: "1")
    end
  end
end
