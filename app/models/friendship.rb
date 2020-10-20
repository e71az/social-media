class Friendship < ApplicationRecord
  self.primary_keys = :user_id, :friend_id
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
end
