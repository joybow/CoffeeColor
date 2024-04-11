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
    @user = User.find(params[:id])
    @user.deleted_flg = User.switch_flg(@user.deleted_flg)
    @user.update(deleted_flg: @user.deleted_flg)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back(fallback_location: dashboard_users_path, notice: 'ユーザーを完全に削除しました。')
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
