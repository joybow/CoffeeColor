class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    
    # @user.create_notification_follow!(current_user)
    
    # respond_to do |format|
      # format.html {redirct_to request.referer}
      # format.js
    # end

  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー一覧

  def followings
    users = User.find(params[:user_id])
    @user_follow = users.followings
  end

  def followers
    users = User.find(params[:user_id])
    @user_follow = users.followers
  end
end
