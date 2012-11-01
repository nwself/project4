class Resource < ActiveRecord::Base
  attr_accessible :content, :permissions, :title, :user_project_rel_id
end
