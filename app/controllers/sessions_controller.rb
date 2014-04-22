class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.where(email: params[:user][:email]).first

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render 'new'
    end
  end
end
