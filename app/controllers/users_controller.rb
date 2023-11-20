class UsersController < ApplicationController
  
  def show
  end

  def user_params
    params.required(:user).permit(:name,:postal_code,:address,:phone,
    :introduction,:local,:email).merge(is_roaster: params[:user][:is_roaster].to_i)
  end
end
