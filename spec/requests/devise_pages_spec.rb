require 'spec_helper'

describe "DevisePages" do

  subject { page }

  describe "signin page" do
  	before { visit new_user_session_path }

  	it { should have_content('Username') }
  	it { should_not have_content('Email') }
  end

  describe "signup page" do
  	before { visit new_user_registration_path }

  	it { should have_content('Email') }
  	it { should have_content('Username') }
  end

  describe "signup" do
  	before { visit new_user_registration_path }

  	let(:submit) { "Sign up" }

  	describe "with valid information" do
  		before do
  			fill_in "Username", with: "example"
  			fill_in "Email",    with: "example@project4.org"
  			fill_in "Password", with: "foobar"
  			fill_in "Password confirmation", with: "foobar"
  		end

  		it "should create a user" do
  			expect { click_button submit }.to change(User, :count).by(1)
  		end

  		describe "user should have saved username" do
  			before { click_button submit }
  			let (:user) { User.find_by_email('example@project4.org') }

  			specify { user.username == 'example' }
  		end
    end
  end
end
