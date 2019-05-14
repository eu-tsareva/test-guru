class Admin::RulesController < Admin::BaseController
  def values
    return unless params[:type].present?


    respond_to do |format|
      format.json {
        render json: { values: Rule.values_by_type(params[:type]) }
      }
    end
  end
end
