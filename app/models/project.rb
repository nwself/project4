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

class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :users,:through => :user_project_rels
  has_many :user_project_rels,:dependent => :destroy
  has_many :task_user_proj_rels,:through => :user_project_rels
  has_many :tasks, :through => :task_user_proj_rels
  has_many :bugs, :through => :task_user_proj_rels
end
