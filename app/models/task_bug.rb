class TaskBug < ActiveRecord::Base
  attr_accessible :due_date, :estimated_date, :percentage_completed, :priority, :status, :task_or_bug, :title
end
