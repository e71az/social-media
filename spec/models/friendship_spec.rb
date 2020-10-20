require 'rails_helper'

RSpec.describe Friendship, type: :model do
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
