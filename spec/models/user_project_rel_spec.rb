# == Schema Information
#
# Table name: user_project_rels
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  role       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe UserProjectRel do

	before do
		@project = Project.create(name: "Example Project", description: "lorem ipsum")
		@attr = { user_id: 1, project_id: 1, role: "developer" }
	end

	it "should create a new instance given valid attributes" do
		@project.user_project_rels.create!(@attr)
	end

	describe "with invalid role" do
		before (:each) do
			@rel = @project.user_project_rels.create!(@attr)
			@rel.role = " "
		end

		it { should_not be_valid }
	end
end
