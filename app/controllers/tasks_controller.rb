class TasksController < ApplicationController
  before_action :correct_user, only: [:index]

  def index
    @user = User.find(params[:id])
    @tasks = Task.all.where(user_id: @user.id)
    @task = Task.new
  end

  def create
    @task  = current_user.tasks.build(tasks_params)
    @task.status = params[:id]
    if @task.save
      flash[:success] = "タスクを追加しました"
      redirect_to tasks_path(current_user)
    else
      render 'index'
    end
  end

  private 

    def correct_user
      @user = User.find(params[:id])
      redirect_to tasks_path(current_user) unless @user == current_user
    end

    def tasks_params
      params.require(:task).permit(:title, :status)
    end
end
