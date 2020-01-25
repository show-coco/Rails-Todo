class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "ログインしました"
    else
      render 'new'
    end
  end

  def destroy

  end

  private

    def session_email_params
      params.require(:session).permit(:email)
    end

    def session_password_params
      params.require(:session).permit(:password)
    end
end
