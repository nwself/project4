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
  attr_accessible :project_id, :role, :user_id

  validates :role , inclusion: { :in => %w(admin developer tester client) }

  belongs_to :project
end
