class TasksController < ApplicationController
  before_action :not_logged_in_user, only: [:index]
  before_action :correct_boad, only: [:index]
  before_action :correct_task, only: [:update, :destroy]

  # GET /tasks/:id
  def index # params[id: ユーザのID]
    @user = User.find(params[:id])
    @tasks = Task.all.where(user_id: @user.id)
    @task = Task.new
  end

  # POST /tasks/:id
  def create # params[status: タスクの状態]
    @task  = current_user.tasks.build(tasks_params)
    @task.status = params[:status]
    if @task.save
      flash[:success] = "タスクを追加しました"
      redirect_to tasks_path(current_user)
    else
      render 'index'
    end
  end

  # PATCH /tasks/:id
  def update # params[id: タスクのID, status: タスクの状態]
    @task = Task.find(params[:id])
    if @task.update_attribute(:status, params[:status])
      flash[:success] = "タスクをスライドしました"
      redirect_to tasks_path(current_user)
    else 
      flash[:danger] = "スライドに失敗しました"
      redirect_to tasks_path(current_user)
    end
  end

  # DELETE /tasks/:id
  def destroy # params[id: タスクのID]
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました"
    redirect_to tasks_path(current_user.id)
  end

  private 
    def tasks_params
      params.require(:task).permit(:title)
    end

end
