class FriendshipsController < ApplicationController
  def new
    friendship = Friendship.new(post_params)
    if friendship.save
      # TODO: Friendships Index Path
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def destroy
    Friendship.find([current_user.id, params[:id]]).destroy
    # TODO: Friendships Index Path
    redirect_to users_path
  end

  private

  def post_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
