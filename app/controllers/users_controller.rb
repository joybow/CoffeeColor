class UsersController < ApplicationController
  before_action :set_user
  
  def show
    
  end
  def create
    @user = @user.new(user_params)
    @user.user_image.attach(params[:user][:user_image])
    if @user.save
      redirect_to mypage_user_path
    else
      render :create
    end
  end
  def index
    @users = User.page(params[:page]).per(PER)
  end 

  def edit
  end

  def update
    @user.update_without_password(user_params)
    @user.user_image.attach(params[:user][:user_image]) if @user.user_image.blank?
    if params[:user][:user_image_id]
      @user.user_image.purge
    end
    if @user.update(user_params)
      flash[:notice] = "プロフィールが変更されました！"
      redirect_to mypage_edit_user_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def mypage
    @name = current_user.name
    @image = current_user.user_image
    
  end

  def color_picker
  end
  
  def edit_address
  end

  def show
  end

  def posts
  end

  def destroy
    @user.deleted_flg = User.switch_flg(@user.deleted_flg)
    @user.update(deleted_flg: @user.deleted_flg)
    redirect_to mypage_user_path
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.required(:user).permit(:name,:postal_code,:address,:phone,
    :introduction,:local,:favorites,:email,:user_image).merge(is_roaster: params[:user][:is_roaster].to_i)
  end

  def post_params
    params.require(:post).permit(:title, :body, :content, post_images:[])
  end
end
