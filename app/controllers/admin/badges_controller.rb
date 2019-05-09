class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      @badge.create_rule(
        attr: params[:badge][:rule_type],
        value: params[:badge][:rule_value])
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :rule_id)
  end
end
