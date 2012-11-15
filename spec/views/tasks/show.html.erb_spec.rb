require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "Title",
      :task_or_bug => "Task Or Bug",
      :status => "Status",
      :priority => "Priority",
      :percentage_completed => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Task Or Bug/)
    rendered.should match(/Status/)
    rendered.should match(/Priority/)
    rendered.should match(/1.5/)
  end
end
