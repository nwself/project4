require 'spec_helper'

describe "task_user_proj_rels/show" do
  before(:each) do
    @task_user_proj_rel = assign(:task_user_proj_rel, stub_model(TaskUserProjRel,
      :task_bug => nil,
      :user_project_rel => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
