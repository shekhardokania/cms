class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  skip_before_filter :require_login, :only => [:new,:create]

  # get /users/1
  # get /users/1.json
  def show
  end

  # get /users/new
  def new
    @user = user.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # post /users
  # post /users.json
  def create
    if 1 != params[:t_and_c].to_i
      flash[:error] = "please agree to the terms and condition"
      redirect_to :back and return
    end
    @user = User.new(user_params)
    @user.set_role
    respond_to do |format|
      if @user.save
        auto_login(@user)
        format.html { redirect_to appointments_path, notice: 'Welcome to clinic management system.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # delete /users/1
  # delete /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # use callbacks to share common setup or constraints between actions.
    def set_user
      @user = user.find(params[:id])
    end

    # never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,:username)
    end
end
