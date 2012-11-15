class UserProjectRel < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :task_user_proj_rels,:dependent => :destroy
  has_many :tasks, :through => :task_user_project_rels
  has_many :bugs, :through => :task_user_project_rels
  attr_accessible :role
end
