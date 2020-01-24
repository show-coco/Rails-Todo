class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(params[:users])
    
    if @user.save
      # リダイレクト
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
end
