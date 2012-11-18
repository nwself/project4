# == Schema Information
#
# Table name: project_resource_rels
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  resource_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProjectResourceRel < ActiveRecord::Base
  attr_accessible :project_id, :resource_id
    belongs_to :resource , :dependent => :destroy
    belongs_to :project

end
