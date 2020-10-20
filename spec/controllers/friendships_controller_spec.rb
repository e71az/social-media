require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  describe 'Friendship Controllers testing' do
    login_user
    it 'Should be able to log in and have a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'Should be equal to ActiveRecord::Relation class' do
      get :index
      expect(assigns(:friendships).class.name).to eq 'ActiveRecord::Relation'
    end
    it 'Successful friendship creation should redirect to users_path' do
      u1 = create(:user)
      u2 = create(:user)
      post :new, params: { friendship: { user_id: u1, friend_id: u2 } }
      expect(response).to redirect_to users_path
    end
    it 'Unsuccessful friendship creation should not redirect to users_path' do
      u1 = create(:user)
      post :new, params: { friendship: { user_id: u1 } }
      expect(response).to_not redirect_to users_path
    end
  end
end
