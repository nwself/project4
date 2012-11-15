require 'spec_helper'

describe "user_project_rels/show" do
  before(:each) do
    @user_project_rel = assign(:user_project_rel, stub_model(UserProjectRel,
      :user => nil,
      :project => nil,
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Role/)
  end
end
