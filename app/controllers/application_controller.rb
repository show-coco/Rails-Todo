class ApplicationController < ActionController::Base
    include SessionsHelper

    def not_logged_in_user
        unless logged_in?
            flash[:danger] = "ログインしてください"
            redirect_to login_path
        end
    end

    def logged_in_user
        if logged_in?
            flash[:danger] = "既にログインしています"
            redirect_to tasks_path(current_user)
        end
    end
  
    def correct_user
        @user = User.find(params[:id])
        redirect_to edit_user_path(current_user) unless @user == current_user
    end 

    def correct_boad
        @user = User.find(params[:id])
        redirect_to tasks_path(current_user) unless @user == current_user
    end

    def correct_task
        @task = Task.find(params[:id])
        redirect_to tasks_path(current_user) unless @task.user_id == current_user.id
    end
end
