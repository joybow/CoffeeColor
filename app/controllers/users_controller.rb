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
    @user.update_without_password(user_params)
    @user.user_image.attach(params[:user][:user_image]) if @user.user_image.blank?
    if params[:user][:user_image_id]
      @user.user_image.purge
    end
    if @user.update(user_params)
      flash[:notice] = "プロフィールが変更されました！"
      redirect_to mypage_edit_user_index_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def mypage
    @profile = User.user_name_profile(current_user)
    @image = current_user.user_image
    @tasks = Task.all
    @user_list = User.where.not(id: current_user.id)
    get_follower_user_ids = Relationship.where(follower_id: @user.id).pluck(:followed_id)
    @users = User.includes(:reverse_of_relationships).where(id: get_follower_user_ids).order("relationships.created_at DESC")
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
    @user.update(deleted_flg: @user.deleted_flg)
    redirect_to mypage_user_path
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.required(:user).permit(:name,:postal_code,:address,:phone,:start_time,
    :introduction,:local,:favorites,:email,:user_image,:user_id).merge(is_roaster: params[:user][:is_roaster].to_i)
  end


  def set_q
    @q = User.ransack(params[:q])
  end
end
