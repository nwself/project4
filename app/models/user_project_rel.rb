# == Schema Information
#
# Table name: user_project_rels
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  role       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserProjectRel < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  has_many :task_user_proj_rels,:dependent => :destroy
  has_many :tasks, :through => :task_user_proj_rels
  has_many :bugs, :through => :task_user_proj_rels

  attr_accessible :role, :user_id, :project_id, inclusion: { :in => %w(Administrator Developer Tester Client) }
    
    def username()
      User.find(user_id).username
    end
    
end
