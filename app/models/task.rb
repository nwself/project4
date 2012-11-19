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

class Task < ActiveRecord::Base
  set_table_name "task_bugs"
  
  has_many :task_user_proj_rels, :foreign_key => "task_bug_id",:dependent => :destroy
  has_many :user_project_rels, :through => :task_user_proj_rels
  has_many :users, :through => :user_project_rels
  has_many :project, :through => :user_project_rels
  
  attr_accessible :due_date, :estimated_date, :percentage_completed, :priority, :status, :task_or_bug, :title, :owner
  
  validates :title, :status, :priority, :due_date, :presence=> true
   validates :percentage_completed, :numericality => { :only_integer => true ,:greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  validates :title, :length => { :maximum => 250 }
  validates :status, :inclusion => { :in => ['Open', 'In Progress', 'Complete'],
    :message => "%{value} is not a valid status" }    
  validates :priority, :inclusion => { :in => %w(High Medium Low),
    :message => "%{value} is not a valid status" }
    
  acts_as_commentable
  acts_as_taggable

  before_save :default_for_task
  def default_for_task
    self.task_or_bug = 'T'
  end
end
