# == Schema Information
#
# Table name: task_user_proj_rels
#
#  id                  :integer          not null, primary key
#  task_bug_id         :integer
#  user_project_rel_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class TaskUserProjRel < ActiveRecord::Base
  belongs_to :task, :foreign_key => "task_bug_id", :conditions => "task_or_bug = 'T' " , :dependent => :destroy
  belongs_to :bug, :foreign_key => "task_bug_id", :conditions => "task_or_bug = 'B' " , :dependent => :destroy
  belongs_to :user_project_rel
  # attr_accessible :title, :body
end
