
def sign_in(user)
	visit new_user_session_path
	fill_in 'Username', with: user.username
	fill_in 'Password', with: user.password
	click_link_or_button('Sign in')
end
