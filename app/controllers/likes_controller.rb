class LikesController < ApplicationController
  def create
    item = Newsfeed.find(params[:item_id])
    like = Like.new
    like.user = current_user
    like.newsfeed = item
    if like.save
      flash[:notice] = "You're liking the item!"
    else
      flash[:error] = "Item can only be added once!"
    end
    redirect_to root_url
  end
end