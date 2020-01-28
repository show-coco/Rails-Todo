class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  before_action :correct_user, only: [:destroy]

  # GET /login
  def new
    @user = User.new()
  end

  # POST /login
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

  # DELETE logout
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
