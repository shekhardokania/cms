class SessionsController < ApplicationController

  before_action :set_user, only: [:create]
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_url , :notice => "Logged in!"
    else
      flash.now[:alert] = "Login failed"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end

  private
  def set_user
    @user = login(params[:email], params[:password])
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
