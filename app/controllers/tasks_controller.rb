class TasksController < ApplicationController
  
  def index
    @task = Task.where(user_id: current_user.id)
  end


  def new
    @task = Task.new
  end

  def create
    @user = current_user
    @task = Task.new(task_params)
    @task.user_id = @user.id
    
    if @task.save!
      redirect_to mypage_user_index_path, notice: "イベントの登録に成功しました"
    else
      render :create
    end

  end
    
  def destroy
    @task = Task.find(params[user_id])
    @task.user_id = @user.id
    Task.destroy
    redirect_to tasks_path
  end
  private

  def task_params
    params.require(:task).permit(:event_day,:start_time,
    :title, :content, :plan, :place, :end_time, :user_id)
  end 
end
