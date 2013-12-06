class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :require_login, :except => [:not_authenticated]
  helper_method :current_user

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def not_authenticated
    redirect_to login_path, :alert => "Login required."
  end
  protect_from_forgery with: :exception
end
