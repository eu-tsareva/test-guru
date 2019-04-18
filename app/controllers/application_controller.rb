class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_quizzes_path
    else
      root_path
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
