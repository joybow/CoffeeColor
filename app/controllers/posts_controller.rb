class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:delete_confirm,:new,:image_delete, :create, :index,:search_result, :confirm, :save, :back,:edit_confirm ]
  before_action :set_q, only: [:search_result]
  # before_action :permit_params, only: [:confirm,:back,:edit_confirm]
  
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
    @existing_images = @post.post_images
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

      if @post.save!
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
    @post = Post.find(params[:id])
    @existing_blobs = if params[:post][:existing_image_ids].present?
                        params[:post][:existing_image_ids].map{|blob_id| ActiveStorage::Blob.find(blob_id)}
                      else
                        []
                      end
    @new_image_blobs =  if params[:post][:post_images].present?
                          params[:post][:post_images].map do |file|
                            create_blob(file)
                          end
                        else
                          []
                        end
    @image_blobs = @existing_blobs + @new_image_blobs

    @post.post_images.attach(@new_image_blobs) if @new_image_blobs.any?
  end

  def image_delete
    if params[:blob_id].present?
      blob_id = params[:blob_id]
      image = ActiveStorage::Blob.find_by(id: blob_id)
      if image.present?
        image.attachments.each do |at|
          at.purge
        end
        image.purge
        redirect_back(fallback_location: root_path)
      else
        render json: { message: "画像がないよ！" }, status: :not_found
      end
    else
      render json: { message: "削除する画像が指定されていません" }, status: :bad_request
    end
  end

  def delete_confirm
    @image_blob_id = ActiveStorage::Blob.find(params[:id])
    @image_blob_id.purge
  end
  def search_result
    @range = params[:range]
    @word = params[:word]
    @search = params[:search]
    @tag = params[:tag]
  
    if @tag == 'タグで検索しない'
      if @range == 'タイトル'
        @posts = Post.looks(@search, @word, :title)
      elsif @range == '内容'
        @posts = Post.looks(@search, @word, :content)
      else
        @posts = Post.looks(@search, @word, :title, :content)
      end
    else
      if @range == 'タイトル'
        @posts = Post.looks(@search, @word, @tag, :title)
      elsif @range == '内容'
        @posts = Post.looks(@search, @word, @tag, :content)
      else
        @posts = Post.looks(@search, @word, @tag, :title, :content)
      end
    end
  end
  
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    
    if params[:back].present?
      render 'edit'
    elsif @post.update(post_params)
      if @post.post_images.present?
        @post.post_images.each do |attc|
          @blob = attc.blob
        end
      end
      redirect_to post_url(@post), notice: "投稿はアップデートされました"
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
      params.require(:post).permit( :title, :content,:post_inside,image_blob_ids:[], post_images:[],exists_images:[], tag_ids: [])
    end

    def set_q
      @q = Post.ransack(params[:q])
    end
    
    def create_blob(file)
      ActiveStorage::Blob.create_and_upload!(
        io: file.open,
        filename: file.original_filename,
        content_type: file.content_type,
        service_name: 'local'
      )
    end

    def permit_params
      @attr = params.require(:post).permit( :content, :title, :post_images[])
    end
  end