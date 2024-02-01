class RelationshipsController < ApplicationController
  before_action :set_user, except: [:create, :destroy]

  def create
    current_user.follow(params[:user_id])
    @list = User.find(params[:user_id])
    # @user.create_notification_follow!(current_user)
    
    # respond_to do |format|
      # format.html {redirct_to request.referer}
      # format.js
    # end

  end

  def destroy
    current_user.unfollow(params[:user_id])
    @list = User.find(params[:user_id])
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

  def set_user
    @list = User.all
  end
end
