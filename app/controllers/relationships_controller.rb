class RelationshipsController < ApplicationController
  before_action :set_user, except: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    @user.create_notification_follow!(current_user)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
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
    @users = User.all
  end
end
