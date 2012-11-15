require "spec_helper"

describe UserProjectRelsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_project_rels").should route_to("user_project_rels#index")
    end

    it "routes to #new" do
      get("/user_project_rels/new").should route_to("user_project_rels#new")
    end

    it "routes to #show" do
      get("/user_project_rels/1").should route_to("user_project_rels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_project_rels/1/edit").should route_to("user_project_rels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_project_rels").should route_to("user_project_rels#create")
    end

    it "routes to #update" do
      put("/user_project_rels/1").should route_to("user_project_rels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_project_rels/1").should route_to("user_project_rels#destroy", :id => "1")
    end

  end
end
