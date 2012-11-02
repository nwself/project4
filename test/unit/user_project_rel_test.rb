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

require 'test_helper'

class UserProjectRelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
