require 'spec_helper'

describe "bugs/edit" do
  before(:each) do
    @bug = assign(:bug, stub_model(Bug,
      :title => "MyString",
      :task_or_bug => "MyString",
      :status => "MyString",
      :priority => "MyString",
      :percentage_completed => 1.5
    ))
  end

  it "renders the edit bug form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bugs_path(@bug), :method => "post" do
      assert_select "input#bug_title", :name => "bug[title]"
      assert_select "input#bug_task_or_bug", :name => "bug[task_or_bug]"
      assert_select "input#bug_status", :name => "bug[status]"
      assert_select "input#bug_priority", :name => "bug[priority]"
      assert_select "input#bug_percentage_completed", :name => "bug[percentage_completed]"
    end
  end
end
