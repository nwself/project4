require 'spec_helper'

describe "user_project_rels/edit" do
  before(:each) do
    @user_project_rel = assign(:user_project_rel, stub_model(UserProjectRel,
      :user => nil,
      :project => nil,
      :role => "MyString"
    ))
  end

  it "renders the edit user_project_rel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_project_rels_path(@user_project_rel), :method => "post" do
      assert_select "input#user_project_rel_user", :name => "user_project_rel[user]"
      assert_select "input#user_project_rel_project", :name => "user_project_rel[project]"
      assert_select "input#user_project_rel_role", :name => "user_project_rel[role]"
    end
  end
end
