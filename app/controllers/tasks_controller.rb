class TasksController < ApplicationController
  before_action :set_tasks, only: [:destroy]

  def index
    @task = Task.all
    @user_task = Task.where(user_id: current_user.id)
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    
    if @task.save!
      redirect_to tasks_path, notice: "イベントの登録に成功しました"
    else
      render :create
    end
  end
    
  def destroy

    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:event_day,:start_time,
    :title, :content, :plan, :place, :end_time, :user_id)
  end
  
  def set_tasks
    @task = Task.find(params[:id])
  end
end
