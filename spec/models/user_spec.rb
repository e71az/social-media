require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model tests' do
    it 'Empty email should not be valid' do
      expect {create(:user, email: '')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank")
    end

    it 'Password should be at least 6 characters long' do
      expect {create(:user, password: '12345')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password is too short (minimum is 6 characters)")
    end

    it 'Name should be present' do
      expect {create(:user, name: '')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

  end
end
