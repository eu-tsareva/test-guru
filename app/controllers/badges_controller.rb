class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @my_badges = current_user.badges
  end
end
