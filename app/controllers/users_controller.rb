class UsersController < ApplicationController
  before_action :set_user
  
  
  def index
    @users = User.page(params[:page]).per(PER)
  end 

  def edit
  end

  def update
    @user.update_without_current_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
    @name = current_user.name
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
  
end
