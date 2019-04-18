class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_quizzes_path
    else
      root_path
    end
  end

end
