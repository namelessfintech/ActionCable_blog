class FriendshipsController < ApplicationController
  def friend
    @user = User.find_by(id: params[:format])
    current_user.friends << @user if @user
    redirect_to user_profile_path(@user)
  end

  def unfriend
    @user = User.find_by(id: params[:format])
    # current_user.friends.delete(@user) if @user
    Friendship.delete(@user.friendship(current_user).id)
    redirect_to user_profile_path(@user)
  end
end
