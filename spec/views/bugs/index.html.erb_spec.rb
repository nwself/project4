require 'spec_helper'

describe "bugs/index" do
  before(:each) do
    assign(:bugs, [
      stub_model(Bug,
        :title => "Title",
        :task_or_bug => "Task Or Bug",
        :status => "Status",
        :priority => "Priority",
        :percentage_completed => 1.5
      ),
      stub_model(Bug,
        :title => "Title",
        :task_or_bug => "Task Or Bug",
        :status => "Status",
        :priority => "Priority",
        :percentage_completed => 1.5
      )
    ])
  end

  it "renders a list of bugs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Task Or Bug".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Priority".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
