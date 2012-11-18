# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe "Project" do

  before do
    @project = Project.new(name: "Example Project", description: "lorem ipsum yall")
    @attr = { name: "Example Project", description: "lorem ipsum yall" }
  end

  subject { @project }
  
  it { should respond_to(:name) }
  it { should respond_to(:description) }

  describe "user_project_rel associations" do
  	before(:each) do
  		@project = Project.create(@attr)
  	end
  	
  	it "should have a user_project_rels attribute" do
  		@project.should respond_to(:user_project_rels)
  	end
  end
end
