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