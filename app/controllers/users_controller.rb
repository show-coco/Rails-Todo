class UsersController < ApplicationController
  before_action :not_logged_in_user, only: [:edit, :update]
  before_action :logged_in_user, only: [:new]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /users/
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "登録が完了しました"
      login(@user)
      redirect_to tasks_path(@user)
    else
      render 'new'
    end
  end

  # GET /user/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH /user/:id
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "編集が完了しました"
      redirect_to edit_user_path(@user)
    else
      flash[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
