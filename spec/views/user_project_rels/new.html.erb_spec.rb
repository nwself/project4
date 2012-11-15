require 'spec_helper'

describe "user_project_rels/new" do
  before(:each) do
    assign(:user_project_rel, stub_model(UserProjectRel,
      :user => nil,
      :project => nil,
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new user_project_rel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_project_rels_path, :method => "post" do
      assert_select "input#user_project_rel_user", :name => "user_project_rel[user]"
      assert_select "input#user_project_rel_project", :name => "user_project_rel[project]"
      assert_select "input#user_project_rel_role", :name => "user_project_rel[role]"
    end
  end
end
