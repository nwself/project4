# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :user_project_rels
  has_many :resources, :through=> :user_project_rels
  has_many :users, :through=> :user_project_rels
end
