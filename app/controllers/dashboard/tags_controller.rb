class Dashboard::TagsController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_back(fallback_location: root_path,notice: "保存できました")
    else
      redirect_back(fallback_location: root_path, alert: "保存できませんでした")
    end
    
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def show
    @tag = Tag.find(params[:id])
    @tags = Tag.all
  end
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to dashboard_tags_path, notice: "タグが更新されました"
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to dashboard_tags_path, notice: "タグを削除しました。"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
