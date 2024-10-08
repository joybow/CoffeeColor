# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create, :destroy]
  before_action :reject_user, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end
  
  # def destroy
    # super
  # redirect_to root_path
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(user)
    mypage_user_index_path
  end

  def after_sign_out_path_for(user)
    root_path
  end
  
  def guest_sign_in
    @user = User.guest
    sign_in @user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(
      :sign_in, keys: [:id,:email, :password, :password_confirmation])
  end

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.deleted_flg?
        set_flash_message! :notice, :deleted
        redirect_to new_user_session_path
      end
    end
  end
end
