class IrreflexiveFriendship < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << 'User Cannot Be Friends With Itself' if record.user_id == record.friend_id
  end
end

class Friendship < ApplicationRecord
  validates_with IrreflexiveFriendship

  # [user_id, friend_id] merged to create a Composite Key
  self.primary_keys = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
end
