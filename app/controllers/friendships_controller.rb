class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:user_id])
    if friend
      friendship = Friendship.new(:friend_id => friend.id, :user_id => current_user.id)
      if friendship.save
        flash[:notice] = "Added '#{friend.name}' as your friend!"
      else
        flash[:error] = "Failed to add '#{friend.name}' as your friend!"
      end
      redirect_to user_path(friend)
    else
      flash[:error] = "There is no user with such id!"
      redirect_to root_url
    end
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friend_id = friendship.friend_id
    friendship.destroy
    flash[:notice] = 'Friendship removed'
    redirect_to user_path(friend_id)
  end

end
