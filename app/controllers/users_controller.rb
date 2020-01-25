class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "登録が完了しました"
      # ToDoリスト画面へリダイレクト
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private 
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
