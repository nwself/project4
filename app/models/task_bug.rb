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

class TaskBug < ActiveRecord::Base
  attr_accessible :due_date, :estimated_date, :percentage_completed, :priority, :status, :task_or_bug, :title
end
