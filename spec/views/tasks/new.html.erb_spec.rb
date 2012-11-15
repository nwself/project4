require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :title => "MyString",
      :task_or_bug => "MyString",
      :status => "MyString",
      :priority => "MyString",
      :percentage_completed => 1.5
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_title", :name => "task[title]"
      assert_select "input#task_task_or_bug", :name => "task[task_or_bug]"
      assert_select "input#task_status", :name => "task[status]"
      assert_select "input#task_priority", :name => "task[priority]"
      assert_select "input#task_percentage_completed", :name => "task[percentage_completed]"
    end
  end
end
