require 'rails_helper'

RSpec.describe "posts/comments/index", type: :system do
  describe "Create Post With Comment" do
    it 'Creates Valid Comment' do
      current_user = login_user

      visit posts_path
      fill_in 'Content', with: 'Test Post'
      click_button 'Save'

      fill_in 'Add new Comment', with: 'Test Comment'
      click_button 'Comment'

      expect(page).to have_content("#{current_user.name}: Test Comment")
    end

    it 'Does Not Create Empty Comment' do
      login_user

      visit posts_path
      fill_in 'Content', with: 'Test Post'
      click_button 'Save'

      click_button 'Comment'

      expect(page).to have_content("Content can't be blank")
    end
  end
end
