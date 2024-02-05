class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @post_comments = @post.comments
    if @comment.save
      redirect_back fallback_location: @post, notice: "コメントしました！"
      @post.create_notification_comment!(current_user, @comment.id)
      respond_to :js
    else
      if @comment.blank?
        redirect_back fallback_location: @post, notice:  "コメントを入力してください！"
      else
        redirect_to @post
      end
    end
    @comment_list = Comment.find(params[:comment_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    @comment_list = Comment.find(params[:comment_id])
  end



  def update
    @comment.update(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:post_id)
  end
end
