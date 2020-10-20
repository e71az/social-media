require 'rails_helper'

RSpec.describe 'devise/registrations/new', type: :system do
  describe 'User Authentication' do
    it 'Should redirect to User Sign in' do
      visit root_path
      expect(page).to have_content('Forgot your password?')
    end

    it 'Check that it correctly navigates to root path' do
      visit root_path
      click_link 'Friend Requests'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    it 'Should be able to log in and navigate to timeline' do
      login_user

      visit root_path
      click_on 'Timeline'
      expect(page).to have_content('Recent posts')
    end
  end
end
