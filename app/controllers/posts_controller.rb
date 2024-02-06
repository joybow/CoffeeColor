class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:new, :create, :index,:search_result]
  before_action :set_q, only: [:search_result]
  
  # GET /posts or /posts.json
  def index 
    @posts = Post.all   
    @q = Post.ransack(params[:q])
    @post_name = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comment = Comment.new
    @post_comments = @post.comments
    @q = Post.ransack(params[:q])
    @post_name = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
    @list = Comment.find(params[:id])
  end


  # GET /posts/new
  def new
    @post = Post.new
    @posts = Post.all
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  
  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id #誰が投稿したか指定
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def search_result
    @results = @q.result(distinct: true)
  end
  
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.attach(post_params) if @post.post_images.blank?
    if @post.update!(post_params) 
      redirect_to post_url(@post), notice: "投稿はアップデートされました！"
    else
      render :edit, alert: "アップデートされませんでした。" 
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = set_post
    @post.destroy
    redirect_to posts_path, notice: "ポストの削除が完了しました。" 
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :content, post_images:[],)
    end

    def set_q
      @q = Post.ransack(params[:q])
    end
end
