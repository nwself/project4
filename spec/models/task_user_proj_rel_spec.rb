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

require 'spec_helper'

describe TaskUserProjRel do
  pending "add some examples to (or delete) #{__FILE__}"
end
