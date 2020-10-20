require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Belongs to User' do
    should belong_to(:user)
  end

  it 'Belongs to Post' do
    should belong_to(:post)
  end

  it 'Fails On Invalid User' do
    expect { create(:like, user: nil) }.to(
      raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User must exist')
    )
  end

  it 'Fails On Invalid Post' do
    expect { create(:like, post: nil) }.to(
      raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Post must exist')
    )
  end

  it 'Creates Valid Post' do
    expect(create(:like)).to be_valid
  end
end
