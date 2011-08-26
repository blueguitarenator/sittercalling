class FriendshipsController < ApplicationController

  # PUT /add_friend/1
  # PUT /add_friend/1.xml
  # def update
  # @user = current_user
  # friend = User.find(params[:id])
  # current_user.add_friend(friend)
  # redirect_to user_url(current_user)
  # end
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
    
    #inverse
    friend = User.find(params[:friend_id]);
    friendship2 = friend.friendships.build(:friend_id => current_user.id)
    friendship2.save
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end