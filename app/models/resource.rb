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
  attr_accessible :content, :permissions, :title
    has_one :project,:through => :project_resource_rels
    has_one :project_resource_rel,:dependent => :destroy
end
