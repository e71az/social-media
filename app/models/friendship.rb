class Friendship < ApplicationRecord
  # [user_id, friend_id] merged to create a Composite Key
  self.primary_keys = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
end
