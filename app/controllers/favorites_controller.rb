class FavoritesController < ApplicationController
  before_action :set_user
  


  def create
    @post_favorite = Favorite.new(user_id: @user.id, post_id: params[:post_id])
    @post_favorite.save
    # redirect_to post_path(params[:post_id])
    post = Post.find(params[:post_id])
    post.create_notification_like!(current_user)
    respond_to :js
  end
  
  def destroy
    @post_favorite = Favorite.find_by(user_id: @user.id, post_id: params[:post_id])
    @post_favorite.destroy
    # redirect_to post_path(params[:post_id])
  end


  private
  def set_user
    @user = current_user
  end
end
