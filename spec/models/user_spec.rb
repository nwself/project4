# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#

require 'spec_helper'

describe User do

	before do
		@user = User.new(username: 'example', email: 'example@project4.org',
			             password: 'foobar', password_confirmation: 'foobar')
	end

	subject { @user }

	it { should respond_to(:username) }

	it { should be_valid }

	describe "when username is not present" do
		before { @user.username = " " }
		it { should_not be_valid }
	end

	describe "when username is too short" do
		before { @user.username = 'a' * 5 }
		it { should_not be_valid }
	end
end
