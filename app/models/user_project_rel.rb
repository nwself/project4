class UserProjectRel < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :project_id, :role, :user_id
  belongs_to :projects
  belongs_to :users
  belongs_to :resources
=======
  belongs_to :user
  belongs_to :project
  has_many :task_user_proj_rels,:dependent => :destroy
  has_many :tasks, :through => :task_user_proj_rels
  has_many :bugs, :through => :task_user_proj_rels
    attr_accessible :role, :user_id, :project_id
>>>>>>> new_branch_name
end
