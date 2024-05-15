class RelationshipsController < ApplicationController
  before_action :set_user, except: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    @user.create_notification_follow!(current_user)
    respond_to do |format|
      format.html {redirect_to mypage_user_index_path }
      format.js
    end
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html {redirect_to mypage_user_index_path }
      format.js
    end
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
