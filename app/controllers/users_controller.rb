class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      # ToDoのホームへリダイレクト
    else
      render 'new.html.erb'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
