require 'spec_helper'

describe "task_user_proj_rels/edit" do
  before(:each) do
    @task_user_proj_rel = assign(:task_user_proj_rel, stub_model(TaskUserProjRel,
      :task_bug => nil,
      :user_project_rel => nil
    ))
  end

  it "renders the edit task_user_proj_rel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => task_user_proj_rels_path(@task_user_proj_rel), :method => "post" do
      assert_select "input#task_user_proj_rel_task_bug", :name => "task_user_proj_rel[task_bug]"
      assert_select "input#task_user_proj_rel_user_project_rel", :name => "task_user_proj_rel[user_project_rel]"
    end
  end
end
