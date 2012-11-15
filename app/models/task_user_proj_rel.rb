class TaskUserProjRel < ActiveRecord::Base
  belongs_to :task, :foreign_key => "task_bug_id", :conditions => "task_or_bug = 'T' "
  belongs_to :bug, :foreign_key => "task_bug_id", :conditions => "task_or_bug = 'B' "
  belongs_to :user_project_rel
  # attr_accessible :title, :body
end
