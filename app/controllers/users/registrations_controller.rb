# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super
    
  end

  def update
    super
  end

  def verify
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [ :name, :postal_code, :address, :phone, :email, :password, :is_roaster, :introduction, :local, :password_confirmation ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update, keys: [ :name, :postal_conde, :address, :phone, :email, :password, :is_roaster, :introduction, :local, :password_confirmation ])
  end

  def after_inactive_sign_up_path_for(resource)
    verify_path
  end
end
