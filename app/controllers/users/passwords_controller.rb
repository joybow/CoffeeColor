# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_user, only: [:create]
  
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
    render :edit
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message!(:notice, flash_message)
      sign_in(resource_name, resource)
      respond_with resource, location: mypage_user_index_path(resource)
    else
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def after_resetting_password_path_for(resource)
    after_sign_in_path_for(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    root_path(resource_name) if is_navigational_format?
  end

  def set_minimum_password_length
    @minimum_password_length = resource_class.password_length.min
  end

  def ensure_normal_user
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to new_user_session_path, alert: 'ゲストユーザーのパスワード再設定はできません'
    end
  end
end
