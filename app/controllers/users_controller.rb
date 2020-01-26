class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "登録が完了しました"
      login(@user)
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_path
      end
    end
end
