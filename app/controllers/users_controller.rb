class UsersController < ApplicationController
  before_action :set_user
  
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
    redirect_to root
  end

  private
  def set_user
    @user = current_user
  end
  def user_params
    params.required(:user).permit(:name,:postal_code,:address,:phone,
    :introduction,:local,:email).merge(is_roaster: params[:user][:is_roaster].to_i)
  end
end
