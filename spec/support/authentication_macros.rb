module AuthenticationMacros
  def login_user(user = create(:user))
    visit '/'
    return unless current_path == new_user_session_path

    # Login In
    visit new_user_session_path
    fill_in('user[email]', with: user.email)
    fill_in('user[password]', with: user.password)
    click_button('Log in')
    user
  end

end
