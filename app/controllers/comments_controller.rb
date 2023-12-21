class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @post_comments = @post.comments
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back fallback_location: @post
    else
      flash[:success] = "コメントできませんでした"
      redirect_back fallback_location: @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to @post
  end



  def update
    @comment.update(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:post_id)
  end
end
