class Dashboard::TagsController < ApplicationController
  before_action :authenticate_admin!
  

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
    @tag = Tag.all
  end

  def show
  end
  def update
  end

  def destroy

  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
