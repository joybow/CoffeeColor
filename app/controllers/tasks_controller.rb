class TasksController < ApplicationController
  
  def index
    @task = Task.all
  end


  def new
    @task = Task.new
  end

  def create
    @user = current_user
    @task = Task.new(task_params)
    @task.user_id = @user.id
    
    if @task.save!
      redirect_to mypage_user_path, notice: "イベントの登録に成功しました"
    else
      render :create
    end

  end
    
  def index
    @task = Task.all
  end
  private

  def task_params
    params.require(:task).permit(:start_day_time,:start_time, :title, :content, :plan, :place, :end_time, :user_id)
  end 
end
