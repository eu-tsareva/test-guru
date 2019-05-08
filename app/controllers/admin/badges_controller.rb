class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end
end
