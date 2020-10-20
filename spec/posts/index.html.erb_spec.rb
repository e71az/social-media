require 'rails_helper'

RSpec.describe 'posts/index', type: :system do
  describe 'Post interactions' do
    it 'Should be able to create a post' do
      login_user

      visit posts_path
      fill_in 'Content', with: 'Test Post'
      click_button 'Save'
      expect(page).to have_content('Recent posts')
    end
  end
end
