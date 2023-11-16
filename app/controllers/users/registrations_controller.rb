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

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [ :name, :postal_code, :address, :phone, :email, :password, :password_confirmation ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update, keys: [ :name, :postal_conde, :address, :phone, :email, :password, :password_confirmation ])
  end
end
