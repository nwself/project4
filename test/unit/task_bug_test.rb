# == Schema Information
#
# Table name: task_bugs
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  status               :string(255)
#  priority             :string(255)
#  due_date             :date
#  estimated_date       :date
#  percentage_completed :float
#  task_or_bug          :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class TaskBugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
