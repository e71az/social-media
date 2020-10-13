module FriendshipHelper
  def new_friendship_button(friend_id)
    # Cannot Be Friends With Itself
    return if friend_id == current_user.id

    # Friendship Already Exists
    friendship = Friendship.find_by(user_id: current_user.id, friend_id: friend_id)
    if friendship.nil?
      # New Friendship
      button_to(
        'Send Friend Request',
        friendships_new_path + '?' + friendship_params(friend_id),
        method: :post
      )
    else
      # Delete Pending Friendship Or Friendship
      button_to(
        (friendship.status == false ? 'Cancel Request' : 'Unfriend'),
        friendships_destroy_path(friend_id),
        method: :delete
      )
    end
  end

  private

  def friendship_params(friend_id)
    { 'friendship[user_id]' => current_user.id, 'friendship[friend_id]' => friend_id }.to_param
  end
end
