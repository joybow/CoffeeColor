class TasksController < ApplicationController

  def create
    @user = User.find(params[:id])
    @task = Task.new(task_params)
    @task.user_id = @user.id
  end
    
  def index
    @task = Task.all
  end 
end
private

def task_params
  params.require(:task).permit(:start_time, :title, :content, :plan, :place, :end_time, :user_id)
end