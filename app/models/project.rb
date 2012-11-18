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

  validates :name, presence: true
  validates :description, presence: true

  has_many :users,:through => :user_project_rels
  has_many :user_project_rels,:dependent => :destroy
  has_many :task_user_proj_rels,:through => :user_project_rels
  has_many :tasks, :through => :task_user_proj_rels
  has_many :bugs, :through => :task_user_proj_rels
  has_many :resources,:through => :project_resource_rels
  has_many :project_resource_rels,:dependent => :destroy

  acts_as_commentable
  acts_as_taggable # gives us a project.tag_list
end
