require "rails_helper"

RSpec.describe LibrariesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/libraries").to route_to("libraries#index")
    end

    it "routes to #show" do
      expect(get: "/libraries/1").to route_to("libraries#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/libraries").to route_to("libraries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/libraries/1").to route_to("libraries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/libraries/1").to route_to("libraries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/libraries/1").to route_to("libraries#destroy", id: "1")
    end
  end
end