class Bug < ActiveRecord::Base
  set_table_name "task_bugs"
  
  has_many :task_user_proj_rels, :foreign_key => "task_bug_id"
  has_many :user_project_rels, :through => :task_user_proj_rels
  has_many :users, :through => :user_project_rels
  has_many  :project, :through => :user_project_rels
  
  attr_accessible :due_date, :estimated_date, :percentage_completed, :priority, :status, :task_or_bug, :title
  
  validates :title, :status, :priority, :due_date, :presence=> true
  validates :title, :length => { :maximum => 250 }
  validates :status, :inclusion => { :in => %w(Open Inprogress Complete),
    :message => "%{value} is not a valid status" }    
  validates :priority, :inclusion => { :in => %w(High Medium Low),
    :message => "%{value} is not a valid status" }
    
  before_save :default_for_task
  def default_for_task
    self.task_or_bug= 'B'
  end
end
