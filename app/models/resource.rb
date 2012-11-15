# == Schema Information
#
# Table name: resources
#
#  id                  :integer          not null, primary key
#  content             :string(255)
#  permissions         :string(255)
#  user_project_rel_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Resource < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :content, :permissions, :user_project_rel_id

  has_many :user_proj_rel
  has_one :projects, :through=> :user_proj_rel
=======
  attr_accessible :content, :permissions
    has_one :project,:through => :project_resource_rels
    has_many :project_resource_rels,:dependent => :destroy
>>>>>>> new_branch_name
end
