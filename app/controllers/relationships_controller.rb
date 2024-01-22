class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー一覧

  def followings
    users = User.find(params[:user_id])
    @users = users.followings
  end

  def followers
    users = User.find(params[:user_id])
    @users = users.followers
  end
end
