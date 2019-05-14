class RewardService
  def initialize(current_user)
    @current_user = current_user
  end

  def call
    Badge.find_each do |badge|
      if send "#{badge.rule.attr}_condition_satisfied?", badge.rule.value
        @current_user.badges << badge
      end
    end
  end

  private

  def level_condition_satisfied?(level)
    quizzes_passed =
      @current_user
      .completed_quizzes
      .by_level(level)
      .order(:quiz_id)
      .uniq
    quizzes_passed == Quiz.by_level(level).order(:id)
  end

  def category_condition_satisfied?(category)
    quizzes_passed =
      @current_user
      .completed_quizzes
      .by_category_id(category)
      .order(:quiz_id)
      .uniq
    quizzes_passed == Quiz.by_category_id(category).order(:id)
  end

  def score_condition_satisfied?(score)
    quizzes_passed =
      @current_user
      .quiz_passages
      .where(passed: true)
      .order(:quiz_id)
      .select { |qp| qp.score.to_i >= score.to_i }
      .uniq
    quizzes_passed == Quiz.all.order(:id)
  end

  def attempts_condition_satisfied?(attempts)
    quizzes_passed =
      @current_user
      .quiz_passages
      .order(:created_at)
      .group_by(&:quiz_id)
      .select do |_q_id, q_passages|
        index = q_passages.index(&:passed)
        !index.nil? && index < attempts.to_i
      end
      .keys
      .sort
    quizzes_passed == Quiz.all.order(:id).pluck(:id)
  end
end
