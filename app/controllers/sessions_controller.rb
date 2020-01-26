class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      flash[:success] = "ログインしました"
      redirect_to tasks_path(@user)
    else
      flash[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

  private

    def session_email_params
      params.require(:session).permit(:email)
    end

    def session_password_params
      params.require(:session).permit(:password)
    end
end
