require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Friendship model testing' do
    it 'Irreflexive Friendship test' do
      user1, _user2 = create_users
      friendship = Friendship.new(user: user1, friend: user1)

      expect(friendship).to_not be_valid
    end
    it 'Succesful friendship' do
      user1, user2 = create_users
      friendship = Friendship.new(user: user1, friend: user2)

      expect(friendship).to be_valid
    end
  end
end
