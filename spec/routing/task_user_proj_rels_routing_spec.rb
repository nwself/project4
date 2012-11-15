require "spec_helper"

describe TaskUserProjRelsController do
  describe "routing" do

    it "routes to #index" do
      get("/task_user_proj_rels").should route_to("task_user_proj_rels#index")
    end

    it "routes to #new" do
      get("/task_user_proj_rels/new").should route_to("task_user_proj_rels#new")
    end

    it "routes to #show" do
      get("/task_user_proj_rels/1").should route_to("task_user_proj_rels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/task_user_proj_rels/1/edit").should route_to("task_user_proj_rels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/task_user_proj_rels").should route_to("task_user_proj_rels#create")
    end

    it "routes to #update" do
      put("/task_user_proj_rels/1").should route_to("task_user_proj_rels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/task_user_proj_rels/1").should route_to("task_user_proj_rels#destroy", :id => "1")
    end

  end
end
