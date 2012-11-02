# == Schema Information
#
# Table name: task_user_proj_rels
#
#  id               :integer          not null, primary key
#  task_id          :integer
#  user_project_rel :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class TaskUserProjRelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
