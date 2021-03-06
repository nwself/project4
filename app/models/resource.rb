# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :string(255)
#  permissions :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Resource < ActiveRecord::Base
  attr_accessible :content, :permissions, :title, :attachment
 has_attached_file :attachment
    has_one :project,:through => :project_resource_rels
    has_one :project_resource_rel,:dependent => :destroy

  acts_as_commentable
  acts_as_taggable

end
