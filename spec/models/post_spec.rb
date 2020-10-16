require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model tests' do
    it 'Empty post content should not be valid' do
      expect {create(:post, content: '')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Content can't be blank")
    end

    it 'Post cannot be created by a blank user' do
      expect {create(:post, user: nil)}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User must exist")
    end
  end
end
