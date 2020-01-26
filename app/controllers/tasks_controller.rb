class TasksController < ApplicationController
  before_action :correct_user, only: [:index]

  def index
  end

  private 

    def correct_user
      @user = User.find(params[:id])
      redirect_to tasks_path(current_user) unless @user == current_user
    end
end
