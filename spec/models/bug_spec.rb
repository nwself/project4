# == Schema Information
#
# Table name: task_bugs
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  status               :string(255)
#  priority             :string(255)
#  due_date             :date
#  estimated_date       :date
#  percentage_completed :float
#  task_or_bug          :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'spec_helper'

describe Bug do
  pending "add some examples to (or delete) #{__FILE__}"
end
