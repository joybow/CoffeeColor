class UsersController < ApplicationController
  before_action :set_user
  before_action :set_q, only: [:mypage, :search_results]
  
  
  def create
    @user = @user.new(user_params)
    @user.user_image.attach(params[:user][:user_image])
    if @user.save
      redirect_to mypage_user_path
    else
      render :create
    end
  end
  def index
    @users = User.all
  end 

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      if params[:user][:user_image_id]
        @user.user_image.purge
      elsif params[:user][:user_image].present?
        @user.user_image.attach(params[:user][:user_image])
      end
      bypass_sign_in(@user) if params[:user][:password].present?
      flash[:notice] = "プロフィールが変更されました！"
      redirect_to mypage_edit_user_index_path
    else
      Rails.logger.debug "User update failed: #{@user.errors.full_messages.join(', ')}"
      render "edit", status: :unprocessable_entity
    end
  end

  def mypage
    @profile = User.user_name_profile(current_user)
    @image = current_user.user_image
    @tasks = Task.all
    @user_list = User.where.not(id: current_user.id)
    get_follower_user_ids = Relationship.where(follower_id: @user.id)
                                        .where.not(followed_id: @user.id)
                                        .pluck(:followed_id)
    get_followed_user_ids = Relationship.where(followed_id: @user.id)
                                        .where.not(follower_id: @user.id)
                                        .pluck(:follower_id)
                                        # もっと絞れる whereメソッドで
    @users = User.includes(:reverse_of_relationships).where(id: get_follower_user_ids).order("relationships.created_at DESC")
    can_chat = get_follower_user_ids & get_followed_user_ids 
    @chat = User.where(id: can_chat)
  end
  
  def search_results
    @user_name = @q.result(distinct: true)
  end

  def color_picker
  end
  
  def edit_address
  end

  def show
    @user = User.find(params[:id])
    @user_list = User.all
    @profile = User.user_name_profile(@user)
    
  end

  def posts
  end

  def destroy
    @user.deleted_flg = User.switch_flg(@user.deleted_flg)
    if @user.update(deleted_flg: @user.deleted_flg)
      sign_out @user
      notice_message ='退会処理が完了しました。また、どこかでお会いしましょう'.html_safe
      redirect_to new_user_session_path, notice: notice_message
    else
      redirect_to mypage_user_index_path, alert: '退会処理に失敗しました'
    end

  end

  def confirmations
    @user = User.find_by(email: params[:email])
    if @user.present? && !@user.confirmed?
      @user.send_confirmation_instructions
      flash[:notice] = "確認メールを再送しました。"
    else
      flash[:alert] = "有効なメールアドレスではありません。"
    end
    redirect_to new_user_session_path
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    allowed_params = [:name,:postal_code,:address,:phone,:start_time,:introduction,:local,:favorites,:email,:user_id]
    allowed_params += [:password, :password_confirmation] if params[:user][:password].present?
    allowed_params += [:user_image] if params[:user_image].present?
    params.required(:user).permit(allowed_params).merge(is_roaster: params[:user][:is_roaster].to_i)
  end


  def set_q
    @q = User.ransack(params[:q])
  end
end
