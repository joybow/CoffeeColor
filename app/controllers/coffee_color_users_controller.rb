class CoffeeColorUsersController < ApplicationController
  before_action :set_user
  
  def edit
    
  end

  def update
    
    @user.update_without_password(user_params)
    redirect_to mypage_coffee_color_users_url
  end

  def mypage
    
  end

  def edit_address
    
  end

  private
  def user_params
    params.permit(:name, :emial, :phone, :password, :password_confirmation, :is_roaster, :local, :introduction)
  end
end
