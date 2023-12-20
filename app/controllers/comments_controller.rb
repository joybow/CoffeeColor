class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_params



  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = "コメントしました"
    else
      falsh[:success] = "コメントできませんでした"
      redirect_back fallback_location: posts_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to posts_path(@post)
  end



  def update
    @comment.update(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:post_id)
  end
end
