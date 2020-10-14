require 'rails_helper'

RSpec.describe 'Test Sign In page content', type: :system do
  describe 'Should be in the correct page' do
    it 'Should redirect to User Sign in' do
      visit new_user_session_path
      expect(page).to have_content('Forgot your password?')
    end
  end
end