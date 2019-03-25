class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.first #fixme
  end
end
