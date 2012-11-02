# == Schema Information
#
# Table name: task_user_proj_rels
#
#  id                  :integer          not null, primary key
#  task_id             :integer
#  user_project_rel_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class TaskUserProjRel < ActiveRecord::Base
  attr_accessible :task_id, :user_project_rel_id
end
