module FriendshipValidator
  class IrreflexiveFriendship < ActiveModel::Validator
    def validate(record)
      record.errors[:base] << 'User Cannot Be Friends With Itself' if record.user_id == record.friend_id
    end
  end
end
