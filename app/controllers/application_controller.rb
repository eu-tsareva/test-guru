class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      remember_path
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def remember_path
    session[:return_to] = request.fullpath
  end

  def restore_path
    session[:return_to] || root_path
  end
end
