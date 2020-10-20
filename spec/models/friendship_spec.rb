require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Friendship model testing' do
    it 'Irreflexive Friendship test' do
      user1, _user2 = create_users
      friendship = Friendship.new(user: user1, friend: user1)

      expect(friendship).to_not be_valid
    end

    it 'Successful friendship' do
      user1, user2 = create_users
      friendship = Friendship.new(user: user1, friend: user2)

      expect(friendship).to be_valid
    end

    it 'Belongs to User' do
      should belong_to(:user)
    end

    it 'Belongs to Friend as a User' do
      should belong_to(:friend).class_name('User')
    end

    it 'Fails On Invalid User' do
      expect { create(:friendship, user: nil) }.to(
        raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User must exist')
      )
    end

    it 'Fails On Invalid Friend' do
      expect { create(:friendship, friend: nil) }.to(
        raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Friend must exist')
      )
    end

    it 'Creates Valid Friendship' do
      expect(create(:friendship)).to be_valid
    end
  end
end
