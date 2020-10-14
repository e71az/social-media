require 'rails_helper'

RSpec.describe "posts/index", type: :system do
  describe 'Post interactions' do
    it 'Should be able to create a post' do
      visit new_user_session_path
      # user = User.create(name: "Test", email: "test@test.com", password: "123456")
      login_user
      visit root_path
      fill_in "Content",	with: "Test Post"
      # sleep(3000)

      click_button 'Save'
      expect(page).to have_content("Recent posts")
    end
  end
end

# post, like and comment