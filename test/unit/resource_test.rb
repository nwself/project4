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

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
