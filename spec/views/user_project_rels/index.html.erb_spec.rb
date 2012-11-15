require 'spec_helper'

describe "user_project_rels/index" do
  before(:each) do
    assign(:user_project_rels, [
      stub_model(UserProjectRel,
        :user => nil,
        :project => nil,
        :role => "Role"
      ),
      stub_model(UserProjectRel,
        :user => nil,
        :project => nil,
        :role => "Role"
      )
    ])
  end

  it "renders a list of user_project_rels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
