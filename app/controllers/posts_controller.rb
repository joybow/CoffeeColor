class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:delete_confirm,:new,:image_delete, :create, :index,:search_result, :confirm, :save, :back ]
  before_action :set_q, only: [:search_result]
  before_action :permit_params, only: [:confirm,:back,:edit_confirm]
  
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
    
    if params[:back].present?
      render 'new'
    elsif params[:save].present?
      blob_ids = params[:image_blob_ids]&.values
      blobs = ActiveStorage::Blob.where(id: blob_ids)
      @post.post_images.attach(blobs)
      if @post.save
        redirect_to posts_path, notice: "投稿されました！"
      else
        redirect_to new_post_path
      end
    end
  end

  def confirm  
    @post = Post.new(post_params)
    @image_blobs = []
    if params[:post][:post_images].present?
      params[:post][:post_images].each do |img|
        blob = create_blob(img)
        @image_blobs << blob
      end
      @post.post_images.attach(@image_blobs)
    end
    
    if params[:confirm_button].present?
      render 'posts/confirm'
    else
      session[:confirm_button] = nil
      redirect_to new_post_path(@post)
    end
  end

  def edit_confirm
    @post = Post.new(post_params)
    @image_blobs = []
    if params[:confirm_button].present?
      params[:post][:post_images].each do |img|
        blob = create_blob(img)
        @image_blobs << blob
      end
      @post.post_images.attach(@image_blobs)
    end
  end

  def image_delete
    if params[:delete_button].present? && params[:signed_id].present?
      signed_id = params[:signed_id]
      image = ActiveStorage::Blob.find_signed(singed_id)
      image.purge
      render json: {message: "画像削除完了！"}
    end
  end
  def delete_confirm
    @image_blob_id = ActiveStorage::Blob.find(params[:id])
    @image_blob_id.purge
  end
  def search_result
    @range = params[:range]
    @posts = Post.looks(params[:search],params[:word])
    if @range == 'タイトル'
      @posts = Post.looks(params[:search],params[:word], :title)
    elsif @range == '内容'
      @posts = Post.looks(params[:search],params[:word], :content)
    elsif @range == '両方'
      @posts = Post.looks(params[:search],params[:word], :title, :content)
    end
  end
  
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.post_images.present?
      @post.post_images.each do |attc|
        @blob = attc.blob
      end
    end
    # post_images = post_imageで回す？
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
      params.require(:post).permit( :title, :content,image_blob_ids:[], post_images:[])
    end

    def set_q
      @q = Post.ransack(params[:q])
    end
    
    def create_blob(file)
      ActiveStorage::Blob.create_and_upload!(
        io: file.open,
        filename: file.original_filename,
        content_type: file.content_type
      )
    end
    def permit_params
      @attr = params.require(:post).permit( :content, :title, :post_images[])
    end
  end