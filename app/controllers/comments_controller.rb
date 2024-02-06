class CommentsController < ApplicationController
  before_action :authenticate_user!
  

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @post_comments = @post.comments
    if @comment.blank?
      redirect_back fallback_location: @post, notice:  "コメントを入力してください！"
    else
      if @comment.save
        
        @post.create_notification_comment!(current_user, @comment.id) 
      else
        redirect_to @post
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    
  end



  def update
    @comment.update(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:post_id)
  end
  
end
