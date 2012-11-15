require 'spec_helper'

describe "task_user_proj_rels/index" do
  before(:each) do
    assign(:task_user_proj_rels, [
      stub_model(TaskUserProjRel,
        :task_bug => nil,
        :user_project_rel => nil
      ),
      stub_model(TaskUserProjRel,
        :task_bug => nil,
        :user_project_rel => nil
      )
    ])
  end

  it "renders a list of task_user_proj_rels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
