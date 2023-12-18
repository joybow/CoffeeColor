class Dashboard::UsersController < ApplicationController
  layout "dashboard/dashboard"
  before_action :authenticate_admin!
  extend DisplayList
  

  PER = 15

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].strip
      @users = User.search_infomation(@keyword).display_list(params[:pages])
    else
      @keyword = ""
      @users = User.display_list(params[:pages])
    end
  end

  def update
    @user = set_user
    @user.deleted_flg = User.switch_flg(@user.deleted_flg)
    @user.update(deleted_flg: @user.deleted_flg)
    redirect_to dashboard_users_path, notice: 'ユーザー情報を更新しました。'
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
