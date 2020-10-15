module AuthenticationMacros
  def login_user
    visit '/'
    return unless current_path == new_user_session_path

    # Login In
    user = create(:user)
    visit new_user_session_path
    fill_in('user[email]', with: user.email)
    fill_in('user[password]', with: user.password)
    click_button('Log in')
    sleep(1)

    # Register User
    # visit new_user_registration_path
    # fill_form(:user, user_attributes)
    # click_button('Sign up')
    # sleep(1)
  end
end
