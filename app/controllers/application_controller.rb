class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      get "mypage", :to => "users#mypage"
    else
      flash[:notice] = "新規会員登録完了しました。マイページにて情報を更新して下さい。"
      coffee_color_users_path
    end
  end

  protected


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:signup, keys: [:is_roaster])
    end
end
