class ProjectResourceRel < ActiveRecord::Base
  attr_accessible :project_id, :resource_id
    belongs_to :resource , :dependent => :destroy
    belongs_to :project

end
