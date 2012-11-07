require 'spec_helper'

describe "User project rel pages" do

  subject { page }

  describe "add user page" do
  	before do
      @user = User.create(username: 'example8', email: 'example8@project4.org',
             password: 'foobar', password_confirmation: 'foobar')
      @user.save!

      sign_in @user
      visit new_user_project_rel_path
  	end

    #it { should_not have_content('Username') }
  	it { should_not have_content('user_project_rel') }
  end

end
