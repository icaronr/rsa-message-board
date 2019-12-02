require "rails_helper"

RSpec.describe PublicKeysController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/public_keys").to route_to("public_keys#index")
    end

    it "routes to #new" do
      expect(:get => "/public_keys/new").to route_to("public_keys#new")
    end

    it "routes to #show" do
      expect(:get => "/public_keys/1").to route_to("public_keys#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/public_keys/1/edit").to route_to("public_keys#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/public_keys").to route_to("public_keys#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/public_keys/1").to route_to("public_keys#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/public_keys/1").to route_to("public_keys#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/public_keys/1").to route_to("public_keys#destroy", :id => "1")
    end
  end
end
