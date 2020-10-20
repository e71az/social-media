class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def new
    friendship = Friendship.new(post_params)
    if friendship.save
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def destroy
    friend_user_id = params[:id]
    Friendship.find([current_user.id, friend_user_id]).destroy
    redirect_to users_path
  end

  def reject
    Friendship.find([params[:id], current_user.id]).destroy
    redirect_to friendships_path
  end

  def accept
    Friendship.find([params[:id], current_user.id]).update_columns(status: true)
    redirect_to friendships_path
  end

  def index
    @friendships = Friendship.where(status: false, friend_id: current_user.id)
  end

  private

  def post_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
