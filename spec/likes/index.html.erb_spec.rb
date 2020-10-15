require 'rails_helper'

RSpec.describe 'posts/likes/index', type: :system do
  it 'Likes Comment' do
    login_user

    visit posts_path
    fill_in 'Content', with: 'Test Post'
    click_button 'Save'

    fill_in 'Add new Comment', with: 'Test Comment'
    click_button 'Comment'

    click_link 'Like!'

    expect(page).to have_content('1 likes')
  end
end
