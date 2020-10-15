require 'rails_helper'

def create_users
  user1 = login_user
  user2 = create(:user, name: "Daniel")

  [user1, user2]
end

RSpec.describe "friendships/index", type: :system do
  describe "Friendship manipulation" do
    it "Send a friendship request" do
      create_users

      visit users_path
      click_button 'Send Friend Request'
      expect(page).to have_button('Cancel Request')
    end

    it "Cancel a friend request" do
      create_users

      visit users_path
      click_button 'Send Friend Request'
      click_button 'Cancel Request'
      expect(page).to have_button('Send Friend Request')
    end

    it "Accept a friend request" do
      user1, user2 = create_users

      visit users_path
      click_button 'Send Friend Request'
      click_link 'Sign out'
      login_user(user2)
      visit friendships_path
      click_button 'Accept'
      click_link 'Sign out'
      login_user(user1)
      visit users_path

      expect(page).to have_button('Unfriend')
    end

    it "Reject a friend request" do
      user1, user2 = create_users

      visit users_path
      click_button 'Send Friend Request'
      click_link 'Sign out'
      login_user(user2)
      visit friendships_path
      click_button 'Reject'
      click_link 'Sign out'
      login_user(user1)
      visit users_path

      expect(page).to have_button('Send Friend Request')
    end

    it "Mutual Friendship" do
      user1, user2 = create_users

      # Send Friend Request To User2
      visit users_path
      click_button 'Send Friend Request'
      click_link 'Sign out'

      # Accept Friend Request From User1
      login_user(user2)
      visit friendships_path
      click_button 'Accept'

      # Send Friend Request To User1
      visit users_path
      click_button 'Send Friend Request'
      click_link 'Sign out'

      # Accept Friend Request From User2
      login_user(user1)
      visit users_path

      expect(page).to have_button('Unfriend')
    end
  end
end
